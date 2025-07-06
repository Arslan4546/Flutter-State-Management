import 'package:api_practice_with_bloc/Model/post_model.dart';
import 'package:api_practice_with_bloc/Repositories/api_repository.dart';
import 'package:api_practice_with_bloc/Utils/api_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiRepository apiRepository;
  ApiBloc(this.apiRepository) : super(ApiState()) {
    on<FetchApiDataEvent>(fetchData);
  }

  void fetchData(FetchApiDataEvent event, Emitter<ApiState> emit) async {
    apiRepository
        .fetchPosts()
        .then((data) {
          emit(state.copyWith(dataList: data, status: APIStatus.success));
        })
        .catchError((error) {
          emit(
            state.copyWith(
              errorMessage: error.toString(),
              status: APIStatus.failed,
            ),
          );
        });
  }
}
