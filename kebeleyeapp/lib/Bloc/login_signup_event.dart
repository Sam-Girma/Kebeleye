import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
@override
  
  List<Object?> get props => throw UnimplementedError();
}

class LoginScreenEvent extends AuthEvent{}
class SignupScreenEvent extends AuthEvent{}

class LoginOfficialEvent extends AuthEvent{
  final String username;
  final String password;
  LoginOfficialEvent(this.username,this.password);
}
class SignupOfficialEvent extends AuthEvent{
  final String username;
  final String department;
  final String password;
  final String kebeleyeid;
  SignupOfficialEvent(this.kebeleyeid, this.username, this.department, this.password);
}

class LoginMemberEvent extends AuthEvent{
  final String username;
  final String password;
  LoginMemberEvent(this.username, this.password);
}
class SignupMemberEvent extends AuthEvent{
  final String username;
  final String password;
  final String id;
  SignupMemberEvent(this.username, this.password, this.id);
}
class GotoOfficialLoginEvent extends AuthEvent{}