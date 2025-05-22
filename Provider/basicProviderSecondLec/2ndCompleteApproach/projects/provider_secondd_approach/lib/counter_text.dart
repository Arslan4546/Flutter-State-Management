import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_secondd_approach/counter.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final counterText = Provider.of<Counter>(context, listen: true);
    return Text(counterText.count.toString());
  }
}
// This widget listens to the Counter class and rebuilds when the count changes.
// It uses the Provider package to access the Counter instance.
// The Counter class is a ChangeNotifier, which means it can notify its listeners