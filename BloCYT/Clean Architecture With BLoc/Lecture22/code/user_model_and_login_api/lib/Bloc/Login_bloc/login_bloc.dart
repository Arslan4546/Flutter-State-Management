import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_event.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginBloc() : super(const LoginStates()) {
    on<EmailEvent>(_emailBlocFun);
    on<PasswordEvent>(_passwordBlocFun);
  }

  void _emailBlocFun(EmailEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordBlocFun(PasswordEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.password));
  }
}
