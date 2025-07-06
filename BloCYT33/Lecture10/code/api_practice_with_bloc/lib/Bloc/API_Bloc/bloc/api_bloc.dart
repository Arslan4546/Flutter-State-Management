import 'package:api_practice_with_bloc/Model/post_model.dart';
import 'package:api_practice_with_bloc/Utils/api_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiState()) {}
}
