import 'package:equatable/equatable.dart';


import 'bloc.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object?> get props => [];

  get issignupScreen => null;

}
class IdleLoginstate extends AuthState{
  bool is_signupScreen = false;
  IdleLoginstate();
  
}
class IdleSignupstate extends AuthState{
  
}
class LoginngInState extends AuthState{

}
class LoginSuccessfulState extends AuthState{
  final member;
  LoginSuccessfulState(this.member);


}
class LoginFailedState extends AuthState{

}
class LoginOfficialstate extends AuthState{}
class Loginmemberstate extends AuthState{}