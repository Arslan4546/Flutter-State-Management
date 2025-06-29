class Item {
  final int id;
  final String name;
  final bool favorite;
  Item({required this.id, required this.name, this.favorite = false});

  Item copyWith({int? id, String? name, bool? favorite}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      favorite: favorite ?? this.favorite,
    );
  }
}
