import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_select_del_practice/Model/favorite_item_model.dart';
import 'package:favorite_select_del_practice/Repositories/favorite_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteItemModel> favoriteList = [];
  FavoriteRepository favoriteRepository;
  FavoriteBloc(this.favoriteRepository) : super(FavoriteState()) {
    on<FetchListEvent>(fetchListFun);
  }

  void fetchListFun(FetchListEvent event, Emitter<FavoriteState> emit) async {
    favoriteList = await favoriteRepository.fetchItems();
    emit(
      state.copyWith(
        favoriteItemsList: List.from(favoriteList),
        listStatus: ListStatus.success,
      ),
    );
  }
}
