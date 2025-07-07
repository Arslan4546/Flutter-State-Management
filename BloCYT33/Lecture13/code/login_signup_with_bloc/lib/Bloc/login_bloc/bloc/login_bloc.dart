import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_signup_with_bloc/Utils/status_enums.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChangedEvent>(_onChangeEmail);
    on<PasswordChangedEvent>(_onChangePassword);
    on<LoginAPIEvent>(_onLoginAPI);
  }

  void _onChangeEmail(EmailChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onChangePassword(PasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginAPI(LoginAPIEvent event, Emitter<LoginState> emit) {}
}
