import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_insert_delete_practice/Bloc/list_bloc/bloc/list_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen')),
      body: Center(
        child: BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state.items.isEmpty) {
              return const Text('No items yet');
            } else if (state.items.isNotEmpty) {
              return ListView.builder(
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
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var i = 0; i < 10; i++) {
            context.read<ListBloc>().add(AddEvent('Item $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
