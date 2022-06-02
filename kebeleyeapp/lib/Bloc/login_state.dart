import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object?> get props => [];

}
class IdleLoginstate extends AuthState{
}
class IdleSignupstate extends AuthState{
  
}
class LoginngInState extends AuthState{

}
class LoginSuccessfulState extends AuthState{

}
class LoginFailedState extends AuthState{

}