part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {
  const FavoriteEvent();
}

class FetchListEvent extends FavoriteEvent {
  const FetchListEvent();
}
