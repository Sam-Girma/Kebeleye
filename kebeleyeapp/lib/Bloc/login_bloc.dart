import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(IdleLoginstate()){
  on<LoginEvent>((LoginEvent event, Emitter emit){

  }
  
    
  );
  on<ChangetoLoginPage> ((ChangetoLoginPage event, Emitter emit){
    emit(IdleLoginstate());
  });
  on<ChangetoSignupPage> ((ChangetoSignupPage event, Emitter emit){
    emit(IdleSignupstate());
  });
  
}}