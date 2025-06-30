import 'package:favorite_app_practice/Providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteItems = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              ref.read(favoriteProvider.notifier).favoriteItems(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 'All', child: Text('All')),
                const PopupMenuItem(
                  value: 'Favorites',
                  child: Text('Favorites'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(favoriteProvider.notifier).filterList(value);
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: favoriteItems.filteredItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: Icon(
                      item.favorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favoriteProvider.notifier).addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
