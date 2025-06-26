import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_riverpod_practice/stream_function.dart';

final numberProvider = Provider<Number>((ref) {
  return Number();
});

final streamProvider = StreamProvider<int>((ref) {
  return ref.read(numberProvider).getNumbers(100);
});
