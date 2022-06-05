import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/EditScreen_State.dart';
import 'package:kebeleyeapp/Bloc/bloc.dart';
import 'package:kebeleyeapp/models/models.dart';
import 'package:kebeleyeapp/repository/Report_Repository.dart';
import 'package:kebeleyeapp/repository/exporter.dart';

import 'EditScreen_event.dart';
import 'announcement_event.dart';
import 'announcement_state.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditScreenState> {
  final MembersRepository membersRepository;

  
  EditAccountBloc(this.membersRepository) : super(ClearedEditaccountState()) {
    on<EditMemberpassword>((EditMemberpassword event, Emitter emit) async {
      emit(EditingState());
      try{
        final edit = await membersRepository.update(event.password, event.member);
        emit(EditingCompletedState());
      }
      catch(error){
        emit(EditingFailedState());
      }
    });
    
  }
}

