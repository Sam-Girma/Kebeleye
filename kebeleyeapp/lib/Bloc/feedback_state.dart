import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/models.dart';

abstract class FeedbackState extends Equatable{
@override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}

class ClearedReportState extends FeedbackState{}
class ReportingState extends FeedbackState{}
class ReportSuccessful extends FeedbackState{}
class ReportFailedState extends FeedbackState{}
class FetchingReportState extends FeedbackState{}
class FetchingReportFailed extends FeedbackState{}
class FetchingReportSuccessful extends FeedbackState{
  final List<Report> reports;
  FetchingReportSuccessful(this.reports);
}
class UpdateReportState extends FeedbackState{}
class UpdateFailedState extends FeedbackState{}
class UpdatingReportState extends FeedbackState{}
class UpdateReportSuccesful extends FeedbackState{}

class DeletedReportState extends FeedbackState{}
class DeleteFailedState extends FeedbackState{}