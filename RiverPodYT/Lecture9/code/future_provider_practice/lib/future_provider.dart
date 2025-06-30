import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) async {
  // Simulating a network call or some asynchronous operation
  await Future.delayed(const Duration(seconds: 2));
  return 42; // Returning a sample value
});
