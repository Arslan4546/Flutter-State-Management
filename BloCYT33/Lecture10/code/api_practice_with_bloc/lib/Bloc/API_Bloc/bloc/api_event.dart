part of 'api_bloc.dart';

sealed class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class FetchApiDataEvent extends ApiEvent {
  const FetchApiDataEvent();
}
