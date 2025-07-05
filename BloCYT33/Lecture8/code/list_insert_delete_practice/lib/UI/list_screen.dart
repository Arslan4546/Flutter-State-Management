import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen')),
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(index.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: null,
              ),
            );
          },
        ),
      ),
    );
  }
}
