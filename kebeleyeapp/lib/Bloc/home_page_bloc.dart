import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomepageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomepageBloc() : super(CompressedState()) {
    on<ExpandEvent>(_onExpand);
    on<CompressEvent>(_onCompress);
  }
}

void _onExpand(ExpandEvent event, Emitter emit){
  emit(ExpandedState());
}
void _onCompress(CompressEvent event, Emitter emit){
  emit(CompressedState());
}

