import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Screen')),
      body: Center(child: Text("")),
      floatingActionButton: OverflowBar(
        alignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Increment logic
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // Decrement logic
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
