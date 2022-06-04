import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/members.dart';



import 'bloc.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object?> get props => [];

}
class LoginState extends AuthState{}
class LoginginState extends AuthState{}
class LoginSuccesfulState extends AuthState{
  final official;
  LoginSuccesfulState(this.official);
}
class LoginFailedSate extends AuthState {}



class SignupState extends AuthState{}
class SignUpingState extends AuthState{}
class SignupSuccesfulState extends AuthState{
  final member;
  SignupSuccesfulState(this.member);
}
class SignupFailedState extends AuthState{}

class GotoOfficialLoginPageState extends AuthState{}

