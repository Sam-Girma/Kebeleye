import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Infrastructure/auth/Official_repository.dart';
import '../../Infrastructure/core/Post_repository.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomepageBloc extends Bloc<HomePageEvent, HomePageState> {
  final OfficialRepository officialRepository;
  final PostRepository postRepository;

  HomepageBloc(this.officialRepository, this.postRepository)
      : super(FetchingallOfficialsState()) {
    on<FetchallOfficialsEvent>(
        (FetchallOfficialsEvent event, Emitter emit) async {
      emit(FetchingallOfficialsState());
      try {
        final officials = await officialRepository.fetchall();
        emit(IdleHomepageState(officials));
      } catch (error) {
        emit(FetchingOfficialsFailed());
      }

      //final Official retrived = _loading()
    });

    on<OpenOfficialPageEvent>((OpenOfficialPageEvent event, Emitter emit) {
      emit(OpeningOfficialDetailState());
    });
    on<FetchOfficialPostsEvent>(
        (FetchOfficialPostsEvent event, Emitter emit) async {
      emit(FetchingPosts());
      final posts = await postRepository.fetchByOfficial(event.official);
      emit(FetchingPostsSuccessful(posts));
    });
    on<DeleteAccountEvent>((DeleteAccountEvent event, Emitter emit) {
      emit(DelitingAcountState());

      try {
        final member = officialRepository.delete(event.official);
        emit(DeleteAccountSuccessful());
      } catch (error) {
        emit(DeleteAccountFailed());
      }
    });
    on<OpenEditScreenEvent>((OpenEditScreenEvent event, Emitter emit) {
      emit(OpenEditScreenState());
    });
    on<OpenFeedbackEvent>((OpenFeedbackEvent event, Emitter emit) {
      emit(OpenFeedbackScreenState());
    });
    on<OpenreportsEvent>((OpenreportsEvent event, Emitter emit) {
      emit(OpenreportsScreenState());
    });
  }
}
