import 'package:equatable/equatable.dart';

abstract class FeedbackState extends Equatable{
@override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ClearedFeedbackState extends FeedbackState{
  
  
}
class SendingFeedbackState extends FeedbackState{
 
}
class SendingFeedbackSuccess extends FeedbackState{
  
}
class FetchingFeedbackState extends FeedbackState{

}
class FetchedFeedbackState extends FeedbackState{
  final List fetchedData;
  FetchedFeedbackState(this.fetchedData);
}