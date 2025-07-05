import 'package:favorite_select_del_practice/Model/favorite_item_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemModel>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavoriteItemModel> _generateList(int length) {
    return List.generate(
      length,
      (index) => FavoriteItemModel(id: index.toString(), value: 'Item $index'),
    );
  }
}
