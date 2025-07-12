import 'package:api_with_riverpod/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(title: Text('API with Riverpod')),
      body: Center(
        child: list.when(
          data: (data) => Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final listData = data[index];
                return ListTile(
                  title: Text(listData.title),
                  subtitle: Text(listData.body),
                );
              },
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
