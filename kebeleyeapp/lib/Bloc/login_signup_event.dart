import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
@override
  
  List<Object?> get props => throw UnimplementedError();
}
class ChangetoScreens extends AuthEvent{
  final bool is_signupscreen;
  ChangetoScreens({required this.is_signupscreen});
}

class LoginEvent extends AuthEvent{
  final String kebeleyeid;
  final String password;
  LoginEvent({required this.kebeleyeid, required this.password});
  
  
}
class TologinOfficial extends AuthEvent{
 

}