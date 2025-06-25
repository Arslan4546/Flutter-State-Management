import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_riverpod_provider_practice/future_provider.dart';

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
        home: ApiPage(),
      ),
    );
  }
}

class ApiPage extends ConsumerWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncData = ref.watch(apiFetchDataProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          asyncData.when(
            data: (data) => Text(data),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
