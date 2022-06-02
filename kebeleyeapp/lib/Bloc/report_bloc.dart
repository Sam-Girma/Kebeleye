import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/bloc.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ClearedState()) {
    on<ClearEvent>((ClearEvent event, Emitter emit) {});
    on<SendReportEvent>((SendReportEvent event, Emitter emit) {});
    on<FetchReportsByname>((FetchReportsByname event, Emitter emit){});
  }
}
