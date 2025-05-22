import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_secondd_approach/counter.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    return OverflowBar(
      children: [
        FloatingActionButton(
          onPressed: () {
            counter.increment();
          },
          tooltip: "Increment",
        ),
        FloatingActionButton(
          onPressed: () {
            counter.decrement();
          },
          tooltip: "Decrement",
        ),
      ],
    );
  }
}
