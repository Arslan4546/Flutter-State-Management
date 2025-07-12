void main(List<String> args) {
  Person person = Person(name: "Alice", age: 30);
  print("Original: ${person.name}, ${person.age}");
  person = person.copyWith(name: "Bob");
  print("Updated: ${person.name}, ${person.age}");
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  Person copyWith({String? name, int? age}) {
    return Person(name: name ?? this.name, age: age ?? this.age);
  }
}
