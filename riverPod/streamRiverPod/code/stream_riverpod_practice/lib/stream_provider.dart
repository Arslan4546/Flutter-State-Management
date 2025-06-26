import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_riverpod_practice/stream_function.dart';

final numberProvider = Provider<Number>((ref) {
  return Number();
});
// this is the simple stream provider that uses the Number class to generate a stream of numbers
// final streamProvider = StreamProvider<int>((ref) {
//   return ref.read(numberProvider).getNumbers(100);
// });

// this is the family stream provider that takes a parameter to generate a stream of numbers
// it allows you to pass a parameter

final streamProvider = StreamProvider.family<int, int>((ref, max) {
  return ref.read(numberProvider).getNumbers(max);
});
