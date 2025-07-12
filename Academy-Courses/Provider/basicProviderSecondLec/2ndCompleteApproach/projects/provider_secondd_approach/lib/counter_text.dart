import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_secondd_approach/counter.dart';

// this is the CounterText class for displaying the counter value
class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    // we get the instance of the provider Counter class
    // and listen to it for changes
    final counterText = Provider.of<Counter>(context, listen: true);
    // idhr list true krny ka mtlab hai k hum just iss widget ko he listable bna rhhy hain jo counter class k change ko listen kry ga
    return Text(counterText.count.toString());
  }
}
// This widget listens to the Counter class and rebuilds when the count changes.
// It uses the Provider package to access the Counter instance.
// The Counter class is a ChangeNotifier, which means it can notify its listeners