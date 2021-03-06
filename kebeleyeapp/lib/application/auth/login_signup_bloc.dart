import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Infrastructure/auth/Members_repository.dart';
import '../../Infrastructure/auth/Official_repository.dart';
import 'login_signup_event.dart';
import 'login_signup_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final MembersRepository membersRepository;
  final OfficialRepository officialRepository;
  AuthBloc({required this.membersRepository, required this.officialRepository})
      : super(LoginState()) {
    on<LoginScreenEvent>((LoginScreenEvent event, Emitter emit) {
      emit(LoginState());
    });

    on<SignupScreenEvent>((SignupScreenEvent event, Emitter emit) {
      emit(SignupState());
    });
    on<LoginOfficialEvent>((LoginOfficialEvent event, Emitter emit) async {
      emit(LoginginState());
      try {
        final official = await officialRepository.fetchOfficial(
            event.username, event.password);
        emit(LoginSuccesfulState(official));
      } catch (error) {
        emit(LoginFailedSate());
      }
    });
    on<SignupOfficialEvent>((SignupOfficialEvent event, Emitter emit) async {
      emit(SignUpingState());
      try {
        final official = await officialRepository.create(
            event.kebeleyeid, event.username, event.department, event.password);
        emit(SignupSuccesfulState(official));
      } catch (error) {
        emit(SignupFailedState());
      }
    });
    on<LoginMemberEvent>((LoginMemberEvent event, Emitter emit) async {
      emit(LoginginState());
      try {
        final member =
            await membersRepository.fetchuser(event.username, event.password);
        emit(LoginSuccesfulState(member));
      } catch (error) {
        LoginFailedSate();
      }
    });
    on<SignupMemberEvent>((SignupMemberEvent event, Emitter emit) async {
      emit(SignUpingState());
      try {
        final member = await membersRepository.create(
            event.username, event.password, event.id);
        emit(SignupSuccesfulState(member));
      } catch (error) {
        emit(SignupFailedState());
      }
    });
  }
}
