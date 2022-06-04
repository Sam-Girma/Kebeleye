import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/models.dart';

abstract class ReportState extends Equatable{
@override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}

class ClearedReportState extends ReportState{}
class ReportingState extends ReportState{}
class ReportSuccessful extends ReportState{}
class ReportFailedState extends ReportState{}
class FetchingReportState extends ReportState{}
class FetchingReportFailed extends ReportState{}
class FetchingReportSuccessful extends ReportState{
  final List<Report> reports;
  FetchingReportSuccessful(this.reports);
}
class UpdateReportState extends ReportState{
  final Report report;
  UpdateReportState(this.report);
}
class UpdateFailedState extends ReportState{}
class UpdatingReportState extends ReportState{}
class UpdateReportSuccesful extends ReportState{}

class DeletedReportState extends ReportState{}
class DeleteFailedState extends ReportState{}