import 'package:favorite_app_practice/Models/item.dart';
import 'package:favorite_app_practice/Providers/favorite_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteStates>(
      (ref) => FavoriteNotifier(),
    );

class FavoriteNotifier extends StateNotifier<FavoriteStates> {
  FavoriteNotifier()
    : super(FavoriteStates(allItems: [], filteredItems: [], query: ''));

  // this is the adding function onto the home screen
  // it will add the items to the list
  void addItem() {
    List<Item> item = [
      Item(id: 1, name: "MacBook i5", favorite: true),
      Item(id: 2, name: "Lenovo i5", favorite: false),
      Item(id: 3, name: "chromBook i5", favorite: false),
      Item(id: 4, name: "Windows i5", favorite: false),
      Item(id: 5, name: "Lenovo i5", favorite: false),
      Item(id: 6, name: "MacBook i5", favorite: true),
      Item(id: 7, name: "chromBook i5", favorite: false),
      Item(id: 8, name: "MacBook i5", favorite: true),
      Item(id: 9, name: "Lenovo i5", favorite: false),
      Item(id: 10, name: "MacBook i5", favorite: true),
      Item(id: 11, name: "chromBook i5", favorite: true),
      Item(id: 12, name: "Lenovo i5", favorite: true),
      Item(id: 13, name: "Lenovo i5", favorite: false),
    ];
    // assign the items to the state
    // this will update the state with the new items
    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }

  // this is the fucntion to filter the items based on the search query
  void filterList(String queury) {
    state = state.copyWith(filteredItems: filterItems(state.allItems, queury));
  }

  // this isthe fucntion where we give the complete list and query of which it will search the item and give
  List<Item> filterItems(List<Item> items, String queury) {
    if (queury.isEmpty) return items;
    return items
        .where((item) => item.name.toLowerCase().contains(queury.toLowerCase()))
        .toList();
  }

  // this is the function where we give the options to filter the items
  void favoriteItems(String options) {
    state = state.copyWith(
      filteredItems: favoriteList(state.allItems, options),
    );
  }

  //  this is the functon where we give the list and options and will return the filtered list
  List<Item> favoriteList(List<Item> items, String options) {
    if (options == "All") return items;
    return items.where((item) => item.favorite == true).toList();
  }
}
