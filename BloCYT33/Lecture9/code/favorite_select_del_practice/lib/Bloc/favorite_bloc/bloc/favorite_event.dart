part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();
  @override
  List<Object?> get props => [];
}

@immutable
class FetchListEvent extends FavoriteEvent {
  const FetchListEvent();
}

@immutable
class FavoriteItemEvent extends FavoriteEvent {
  final FavoriteItemModel item;
  const FavoriteItemEvent({required this.item});
}
