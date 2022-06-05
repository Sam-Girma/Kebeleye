// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/bloc.dart';
import 'package:kebeleyeapp/models/models.dart';
import '';
import '../repository/exporter.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepository feedbackRepository;

  
  FeedbackBloc(this.feedbackRepository) : super(ClearedFeedbackState()) {
    on<ClearFeedbackEvent>((ClearFeedbackEvent event, Emitter emit) {
      emit(ClearedFeedbackState());
    });
    on<SendFeedbackEvent>((SendFeedbackEvent event, Emitter emit) async{
      emit(FeedbackingState());
      try{
        final report = await feedbackRepository.create(Feedback(feedbackcontent: event.feedbackcontent, user: event.user, official: event.official));
        emit(FeedbackSuccessful());
      }
      catch(error){
        emit(FeedbackFailedState());
      }


    });
    on<MembersFeedbackFetchEvent>((MembersFeedbackFetchEvent event, Emitter emit) async {
      emit(FetchingFeedbackState());
      try{
        final feedbacks = await feedbackRepository.fetchFeedbackByuser(event.user);
        emit(FetchingFeedbackSuccessful(feedbacks));

      }
      catch(error){
        emit(FetchingFeedbackFailed());

      }

    });
    on<ToupdateFeedbackEvent>((ToupdateFeedbackEvent event, Emitter emit)async{
      emit(UpdateFeedbackState(event.feedback));
    });
    on<UpdateFeedbackEvent>((UpdateFeedbackEvent event, Emitter emit) async {
       emit(UpdatingFeedbackState());
       try{
         final reports = await feedbackRepository.update(event.feedbackcontent, event.feedback);
         emit(UpdateFeedbackSuccesful());
       }
       catch(error){
         emit(UpdateFeedbackFailedState());
       }

    });
    on<DeleteFeedbackEvent>((DeleteFeedbackEvent event, Emitter emit) async{
      try{
        final report =await feedbackRepository.delete(event.feedback);
        emit(DeletedReportState());
      }
      catch(error){
        emit(DeleteFailedState());

      }

    });
  }
}
