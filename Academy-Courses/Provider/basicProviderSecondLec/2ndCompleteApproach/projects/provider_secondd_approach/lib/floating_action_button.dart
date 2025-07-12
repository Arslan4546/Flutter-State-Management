import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_secondd_approach/counter.dart';

// this is the separate file for the floating action button widget
class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // we get the instance of the provider Counter class
    var counter = Provider.of<Counter>(context);
    return OverflowBar(
      children: [
        FloatingActionButton(
          onPressed: () {
            counter.increment();
          },
          tooltip: "Increment",
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            counter.decrement();
          },

          tooltip: "Decrement",
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
