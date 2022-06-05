// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/bloc.dart';
import 'package:kebeleyeapp/models/models.dart';
import 'package:kebeleyeapp/repository/Report_Repository.dart';
import 'package:kebeleyeapp/repository/exporter.dart';

import 'announcement_event.dart';
import 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final PostRepository postRepository;

  
  AnnouncementBloc(this.postRepository) : super(ClearedAnnouncementPageState()) {
    on<PostEvent>((PostEvent event, Emitter emit) async {
      emit(PostingAnnouncementState());
      try{
        final announce = await postRepository.create(Post(postcontent: event.postcontent, official: event.official));
        emit(PostingSuccessfulState());
      }
      catch(error){
        emit(FailedPostingAnnouncementState());
      }
    });
    
  }
}
