import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) async {
  // Simulating a network call or some asynchronous operation
  await Future.delayed(const Duration(seconds: 2));
  return 42; // Returning a sample value
});

// this is future provider that returns an List<String> value after a delay
final futureStringListProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return ['Item 1', 'Item 2', 'Item 3'];
});
