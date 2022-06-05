// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/bloc.dart';
import 'package:kebeleyeapp/models/models.dart';
import 'package:kebeleyeapp/repository/Report_Repository.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository reportRepository;

  
  ReportBloc(this.reportRepository) : super(ClearedReportState()) {
    on<ClearReportEvent>((ClearReportEvent event, Emitter emit) {
      emit(ClearedReportState());
    });
    on<SendReportEvent>((SendReportEvent event, Emitter emit) async{
      emit(ReportingState());
      try{
        final report = await reportRepository.create(Report(reportcontent: event.reportcontent, user: event.user, official: event.official));
        emit(ReportSuccessful());
      }
      catch(error){
        emit(ReportFailedState());
      }


    });
    on<MemberReportsFetchEvent>((MemberReportsFetchEvent event, Emitter emit) async {
      emit(FetchingReportState());
      try{
        final reports = await reportRepository.fetchreportByuser(event.user);
        emit(FetchingReportSuccessful(reports));

      }
      catch(error){
        emit(FetchingReportFailed());

      }

    });
    on<ToupdateReportEvent>((ToupdateReportEvent event, Emitter emit)async{
      emit(UpdateReportState(event.report));
    });
    on<UpdateReportEvent>((UpdateReportEvent event, Emitter emit) async {
       emit(UpdatingReportState());
       try{
         final reports = await reportRepository.update(event.postcontent, event.report);
         emit(UpdateReportSuccesful());
       }
       catch(error){
         emit(UpdateFailedState());
       }

    });
    on<DeleteReportEvent>((DeleteReportEvent event, Emitter emit) async{
      try{
        final report =await reportRepository.delete(event.report);
        emit(DeletedReportState());
      }
      catch(error){
        emit(DeleteFailedState());

      }

    });
  }
}
