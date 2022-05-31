import 'package:equatable/equatable.dart';

abstract class FeedbackEvent extends Equatable{
  const FeedbackEvent();

}
class ClearEvent extends FeedbackEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SendfeedbackEvent extends FeedbackEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
} 

