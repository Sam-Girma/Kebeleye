import 'package:equatable/equatable.dart';

abstract class FeedbackEvent extends Equatable{
  const FeedbackEvent();
@override
  // TODO: implement props
  List<Object?> get props => [];

}
class ClearFeedbackEvent extends FeedbackEvent{
  
}
class SendfeedbackEvent extends FeedbackEvent{
 
} 
class FetchfeedbackEvent extends FeedbackEvent{}
