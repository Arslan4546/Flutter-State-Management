import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_practice/future_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final futureValue = ref.watch(futureProvider);
    final futureValue = ref.watch(futureStringListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            futureValue.when(
              skipLoadingOnRefresh: false,
              // data: (value) => Text('Value: $value'),
              data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(data[index]));
                },
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
            // Here you can add a counter or any other widget
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.refresh(futureProvider);
          // Refresh the future provider
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
