import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/models.dart';

abstract class FeedbackState extends Equatable{
@override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}

class ClearedFeedbackState extends FeedbackState{}
class FeedbackingState extends FeedbackState{}
class FeedbackSuccessful extends FeedbackState{}
class FeedbackFailedState extends FeedbackState{}
class FetchingFeecbackState extends FeedbackState{}
class FetchingFeedbackFailed extends FeedbackState{}
class FetchingFeedbackSuccessful extends FeedbackState{
  final List<Report> reports;
  FetchingFeedbackSuccessful(this.reports);
}
class UpdateFeedbackState extends FeedbackState{}
class UpdatefeedbackFailedState extends FeedbackState{}
class UpdatingFeedbackReportState extends FeedbackState{}
class UpdateFeedbackSuccesful extends FeedbackState{}

class DeletedFeedbackState extends FeedbackState{}
class DeleteFailedState extends FeedbackState{}