import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_practice/item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  // this the insert function to add the item  in this list
  void addItem(String name) {
    final item = Item(
      id: DateTime.now().toString(), // Unique ID based on timestamp
      name: name,
    );
    state.add(item);
    state = state.toList(); // Ensure state is a List
  }

  // this the remvoe function to remove the item  in this list
  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void updateItem(String name, String id) {
    final indexFound = state.indexWhere((item) => item.id == id);
    state[indexFound] = Item(id: id, name: name);
  }
}
