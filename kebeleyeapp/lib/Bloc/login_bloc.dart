import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/repository/Members_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final MembersRepository membersRepository;
  AuthBloc(this.membersRepository) : super(IdleLoginstate()) {
    on<ChangetoScreens>(((ChangetoScreens event, Emitter emit) {
      if (event.is_signupscreen){
      emit(IdleLoginstate());}
      else{
        emit(IdleSignupstate());
      }
    }));
    on<LoginEvent>((LoginEvent event, Emitter emit) async {
      final member =
          await membersRepository.fetchuser(event.kebeleyeid, event.password);
      emit(LoginSuccessfulState(member));
    });
  }
}
