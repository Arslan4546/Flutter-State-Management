import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_event.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_states.dart';
import 'package:splash_screen_practice/Repositories/Login_Repositories/login_repo.dart';
import 'package:splash_screen_practice/Utils/Enums/api_enum.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  final LoginRepo _loginRepo = LoginRepo();
  LoginBloc() : super(const LoginStates()) {
    on<EmailEvent>(_emailBlocFun);
    on<PasswordEvent>(_passwordBlocFun);
    on<SubmitButtonEvent>(_loginFun);
  }

  void _emailBlocFun(EmailEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordBlocFun(PasswordEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.password));
  }

  void _loginFun(SubmitButtonEvent event, Emitter<LoginStates> emit) {
    Map<String, dynamic> data = {
      "email": state.email,
      "password": state.password,
    };

    _loginRepo
        .loginAPI(data)
        .then((value) {
          if (state.errorMessage.isEmpty) {
            emit(
              state.copyWith(
                apiStatus: APIStatus.success,
                errorMessage: "Login Successfully",
              ),
            );
          } else {
            emit(
              state.copyWith(
                apiStatus: APIStatus.failed,
                errorMessage: value.error.toString(),
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiStatus: APIStatus.failed,
              errorMessage: error.toString(),
            ),
          );
        });
  }
}
