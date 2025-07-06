part of 'api_bloc.dart';

class ApiState extends Equatable {
  final String errorMessage;
  final List<PostModel> dataList;
  final APIStatus status;

  const ApiState({
    this.errorMessage = '',
    this.dataList = const [],
    this.status = APIStatus.loading,
  });

  ApiState copyWith({
    String? errorMessage,
    List<PostModel>? dataList,
    APIStatus? status,
  }) {
    return ApiState(
      errorMessage: errorMessage ?? this.errorMessage,
      dataList: dataList ?? this.dataList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [errorMessage, dataList, status];
}
