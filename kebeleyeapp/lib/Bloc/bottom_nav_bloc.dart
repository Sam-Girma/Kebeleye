

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/bottom_nav_state.dart';
import 'package:kebeleyeapp/Bloc/botton_nav_bar_event.dart';
import 'package:kebeleyeapp/Bloc/feedback_event.dart';
import 'package:kebeleyeapp/Bloc/feedback_state.dart';
import 'package:kebeleyeapp/pages/tosee_tosend_toreportpage.dart';
import 'package:kebeleyeapp/repository/Post_repository.dart';


class NavBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final PostRepository postrepository;
  NavBloc(this.postrepository) : super(PostPageLoaded()) {
    on<Changepage>((Changepage event, Emitter emit) async {
      if (event.index == 0){
        emit(PageLoading());
        try{
     final posts = await  postrepository.fetchByOfficial(event.official);
     emit(PostPageLoaded());
  }
  catch(error){
    emit(Loadfailed(error));
  } 
    }
    if (event.index ==1){
      emit(PageLoading());
      try{ 
        emit(FeedbackpageLoaded()); 

      }
      catch(error){
        emit(Loadfailed(error));
      }
    }
    if (event.index ==2){
      emit(PageLoading());
      try{
        emit(ReportPageLoaded());
      }
      catch(error){
        emit(Loadfailed(error));
      }
    }
    
  });
}
}