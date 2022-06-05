import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Infrastructure/core/Post_repository.dart';
import 'bottom_nav_state.dart';
import 'botton_nav_bar_event.dart';

class NavBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final PostRepository postrepository;
  NavBloc(this.postrepository) : super(PostPageLoaded()) {
    on<Changepage>((Changepage event, Emitter emit) async {
      if (event.index == 0) {
        emit(PageLoading());
        try {
          final posts = await postrepository.fetchByOfficial(event.official);
          emit(PostPageLoaded());
        } catch (error) {
          emit(Loadfailed(error));
        }
      }
      if (event.index == 1) {
        emit(PageLoading());
        try {
          emit(FeedbackpageLoaded());
        } catch (error) {
          emit(Loadfailed(error));
        }
      }
      if (event.index == 2) {
        emit(PageLoading());
        try {
          emit(ReportPageLoaded());
        } catch (error) {
          emit(Loadfailed(error));
        }
      }
    });
  }
}
