part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FetchListEvent extends FavoriteEvent {
  const FetchListEvent();

  @override
  List<Object?> get props => [];
}
