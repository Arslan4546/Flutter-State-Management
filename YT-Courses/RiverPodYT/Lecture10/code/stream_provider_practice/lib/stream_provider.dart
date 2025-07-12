import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100.0;
  // this below the logic for changing the price periodically
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    currentPrice += random.nextDouble() * 4 - 2;
    // Simulating an error for demonstration
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});
