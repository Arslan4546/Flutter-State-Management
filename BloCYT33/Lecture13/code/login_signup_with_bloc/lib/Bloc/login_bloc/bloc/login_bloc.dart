import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_signup_with_bloc/Utils/status_enums.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {}
}
