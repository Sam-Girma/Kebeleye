import 'package:equatable/equatable.dart';

abstract class FeedbackState extends Equatable{

}
class ClearedState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class SendingFeedbackState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class SendingSuccessfulState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}