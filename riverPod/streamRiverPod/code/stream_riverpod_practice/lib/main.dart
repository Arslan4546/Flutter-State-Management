import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_riverpod_practice/stream_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this is ref is without the family provider
    // AsyncValue<int> streamData = ref.watch(streamProvider);
    // this ref is with the family provider
    AsyncValue<int> streamData = ref.watch(streamProvider(500));
    ref.listen<AsyncValue<int>>(streamProvider(500), (previous, next) {
      int data = 0;
      next.whenData((value) {
        data = value;
      });
      if (data == 5) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('The value is in danger zone ')));
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Riverpod Practice')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            streamData.when(
              data: (value) => Text('Stream value: $value'),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            // Here you can add your StreamProvider widget to display the stream data
          ],
        ),
      ),
    );
  }
}
