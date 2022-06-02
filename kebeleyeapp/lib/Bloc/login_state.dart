import 'package:equatable/equatable.dart';

import '../models/members.dart';

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
  final member;
  LoginSuccessfulState(this.member);


}
class LoginFailedState extends AuthState{

}