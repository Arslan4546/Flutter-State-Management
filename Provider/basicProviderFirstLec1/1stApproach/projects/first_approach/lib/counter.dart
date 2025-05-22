import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
