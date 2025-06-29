class Item {
  final String id;
  final String name;
  final bool isSelected;
  Item({required this.id, required this.name, this.isSelected = false});

  Item copyWith({String? id, String? name, bool? isSelected}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
