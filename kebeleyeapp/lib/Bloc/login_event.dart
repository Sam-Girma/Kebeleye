import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
@override
  
  List<Object?> get props => throw UnimplementedError();
}
class ChangetoLoginPage extends AuthEvent{
  final bool is_signupscreen;
  ChangetoLoginPage({required this.is_signupscreen});
}
class ChangetoSignupPage extends AuthEvent{
  final bool is_signupScreen;
  ChangetoSignupPage({required this.is_signupScreen});
}
class LoginEvent extends AuthEvent{
  final String kebeleyeid;
  final String password;
  LoginEvent({required this.kebeleyeid, required this.password});
  
  
}
class Signup extends AuthEvent{
 

}