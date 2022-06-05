import 'package:equatable/equatable.dart';

import '../../domain/auth/members.dart';
import '../../domain/auth/officials.dart';
import '../../domain/core/feedbacks.dart';

abstract class FeedbackEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ClearFeedbackEvent extends FeedbackEvent {}

class SendFeedbackEvent extends FeedbackEvent {
  final String feedbackcontent;
  final Official official;
  final Member user;
  SendFeedbackEvent(this.feedbackcontent, this.official, this.user);
}

class MembersFeedbackFetchEvent extends FeedbackEvent {
  final Member user;
  MembersFeedbackFetchEvent(this.user);
}

class ToupdateFeedbackEvent extends FeedbackEvent {
  final Feedback feedback;
  ToupdateFeedbackEvent(this.feedback);
}

class UpdateFeedbackEvent extends FeedbackEvent {
  final String feedbackcontent;
  final Feedback feedback;
  UpdateFeedbackEvent(this.feedbackcontent, this.feedback);
}

class DeleteFeedbackEvent extends FeedbackEvent {
  final Feedback feedback;
  DeleteFeedbackEvent(this.feedback);
}
