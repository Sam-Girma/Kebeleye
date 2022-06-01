import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/pages/officials_model_to_display_on_members_home_page.dart';
import '../repository/Official_repo.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomepageBloc extends Bloc<HomePageEvent, HomePageState> {
  final OfficialRepository officialRepository;

  HomepageBloc(this.officialRepository) : super(CompressedState()) {

    on<ExpandEvent>((ExpandEvent event, Emitter emit) async {
  emit(ExpandLoading());
  try{
     final officials = await  officialRepository.fetchByDepartment(event.department);
     emit(ExpandedState());
  }
  catch(error){
    emit(Expandedfailed(error));
  }

  //final Official retrived = _loading()
});

    on<CompressEvent>(_onCompress);
  }
}


void _onCompress(CompressEvent event, Emitter emit){
  emit(CompressedState());
}

void _loading(){

}

