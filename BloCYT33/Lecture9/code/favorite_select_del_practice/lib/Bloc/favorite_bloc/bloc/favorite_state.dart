part of 'favorite_bloc.dart';

enum ListStatus { loading, success, failed }

@immutable
class FavoriteState extends Equatable {
  final List<FavoriteItemModel> favoriteItemsList;
  final ListStatus listStatus;
  const FavoriteState({
    this.favoriteItemsList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavoriteState copyWith({
    List<FavoriteItemModel>? favoriteItemsList,
    ListStatus? listStatus,
  }) {
    return FavoriteState(
      favoriteItemsList: favoriteItemsList ?? this.favoriteItemsList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favoriteItemsList, listStatus];
}
