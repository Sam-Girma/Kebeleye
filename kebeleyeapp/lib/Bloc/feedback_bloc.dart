
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/feedback_event.dart';
import 'package:kebeleyeapp/Bloc/feedback_state.dart';


class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(ClearedFeedbackState()) {
    on<ClearFeedbackEvent>(_onclear);
    on<SendfeedbackEvent>(_onsendfeedback);
  }
}

void _onclear(ClearFeedbackEvent event, Emitter emit){

}
void _onsendfeedback(SendfeedbackEvent event, Emitter emit){

}