import 'package:flutter/material.dart';
import 'package:vanella_implmentation_bloc/BloC/counter_bloc.dart';
import 'package:vanella_implmentation_bloc/BloC/counter_event.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = CounterBloc();
    void increment() {
      counterBloc.sinkEvent.add(const IncrementCounterEvent());
    }

    void decrement() {
      counterBloc.sinkEvent.add(const DecrementCounterEvent());
    }

    void reset() {
      counterBloc.sinkEvent.add(const ResetCounterEvent());
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[],
        ),
      ),
      floatingActionButton: OverflowBar(
        alignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: reset,
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
