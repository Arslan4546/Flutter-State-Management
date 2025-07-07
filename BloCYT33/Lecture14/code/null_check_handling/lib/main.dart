import 'package:flutter/material.dart';
import 'package:null_check_handling/Model/person_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PersonModel> person = [
    PersonModel(name: null, age: 30),
    PersonModel(name: "Arslan", age: 25),
    PersonModel(name: "Mannan", age: 28),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: person.length,
        itemBuilder: (context, index) {
          final personModel = person[index];
          return ListTile(
            title: Text(personModel.name.toString()),
            subtitle: Text('Age: ${personModel.age}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        child: const Icon(Icons.add),
      ),
    );
  }
}
