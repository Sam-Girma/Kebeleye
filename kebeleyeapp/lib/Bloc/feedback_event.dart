import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/members.dart';

import '../models/models.dart';

abstract class FeedbackEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class ClearFeedbackEvent extends FeedbackEvent{
}

class SendFeedbackEvent extends FeedbackEvent{
  final String feedbackcontent;
  final Official official;
  final Member user;
  SendFeedbackEvent(this.feedbackcontent, this.official, this.user);
}
class MembersFeedbackFetchEvent extends FeedbackEvent{
  final Member user;
  MembersFeedbackFetchEvent(this.user);
}
class UpdateFeedbackEvent extends FeedbackEvent{
  final String postcontent;
  final Report feedback;
  UpdateFeedbackEvent(this.postcontent, this.feedback);
}
class DeleteFeedbackEvent extends FeedbackEvent{
  final Report feedback;
  DeleteFeedbackEvent(this.feedback);
}