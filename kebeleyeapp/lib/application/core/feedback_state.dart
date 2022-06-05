import 'package:equatable/equatable.dart';

import '../../domain/core/feedbacks.dart';

abstract class FeedbackState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ClearedFeedbackState extends FeedbackState {}

class FeedbackingState extends FeedbackState {}

class FeedbackSuccessful extends FeedbackState {}

class FeedbackFailedState extends FeedbackState {}

class FetchingFeedbackState extends FeedbackState {}

class FetchingFeedbackFailed extends FeedbackState {}

class FetchingFeedbackSuccessful extends FeedbackState {
  final List<Feedback> feedback;
  FetchingFeedbackSuccessful(this.feedback);
}

class UpdateFeedbackState extends FeedbackState {
  final Feedback feedback;
  UpdateFeedbackState(this.feedback);
}

class UpdateFeedbackFailedState extends FeedbackState {}

class UpdatingFeedbackState extends FeedbackState {}

class UpdateFeedbackSuccesful extends FeedbackState {}

class DeletedFeedbackState extends FeedbackState {}

class DeleteFeedbackFailedState extends FeedbackState {}
