import 'package:favorite_app_practice/Models/item.dart';

class FavoriteStates {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String query;
  FavoriteStates({
    required this.allItems,
    required this.filteredItems,
    required this.query,
  });

  FavoriteStates copyWith({
    List<Item>? allItems,
    List<Item>? filteredItems,
    String? query,
  }) {
    return FavoriteStates(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      query: query ?? this.query,
    );
  }
}
