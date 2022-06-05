// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Infrastructure/core/Post_repository.dart';
import '../../domain/core/posts.dart';
import 'announcement_event.dart';
import 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final PostRepository postRepository;

  AnnouncementBloc(this.postRepository)
      : super(ClearedAnnouncementPageState()) {
    on<PostEvent>((PostEvent event, Emitter emit) async {
      emit(PostingAnnouncementState());
      try {
        final announce = await postRepository.create(
            Post(postcontent: event.postcontent, official: event.official));
        emit(PostingSuccessfulState());
      } catch (error) {
        emit(FailedPostingAnnouncementState());
      }
    });
  }
}
