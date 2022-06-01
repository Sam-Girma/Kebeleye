
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/feedback_event.dart';
import 'package:kebeleyeapp/Bloc/feedback_state.dart';


class HomepageBloc extends Bloc<FeedbackEvent, FeedbackState> {
  HomepageBloc() : super(ClearedState()) {
    on<ClearEvent>(_onclear);
    on<SendfeedbackEvent>(_onsendfeedback);
  }
}

void _onclear(ClearEvent event, Emitter emit){

}
void _onsendfeedback(SendfeedbackEvent event, Emitter emit){

}