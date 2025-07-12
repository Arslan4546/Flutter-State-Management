import 'package:flutter/material.dart';

// this is the counter class for putting some counting logic
class Counter extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
