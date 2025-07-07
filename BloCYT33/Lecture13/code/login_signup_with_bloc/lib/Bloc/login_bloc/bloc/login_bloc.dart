import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
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

  Future<void> _onLoginAPI(
    LoginAPIEvent event,
    Emitter<LoginState> emit,
  ) async {
    Map data = {"email": state.email, "password": state.password};

    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: data,
      );
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            status: LoginStatus.success,
            errorMessage: 'Login successful',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.failed,
            errorMessage: 'Login failed',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failed,
          errorMessage: 'An error occurred: $e',
        ),
      );
    }
  }
}
