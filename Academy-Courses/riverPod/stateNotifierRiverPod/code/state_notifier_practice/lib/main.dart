import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_practice/state_notifier_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CounterText(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CounterButton(),
            SizedBox(width: 16),
            CounterDecrementButton(),
            SizedBox(width: 16),
            CounterResetButton(),
          ],
        ),
      ],
    );
  }
}

class CounterText extends ConsumerWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(stateProvider);
    return Text(
      'Counter: $count',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class CounterButton extends ConsumerWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(stateProvider.notifier).increment();
      },
    );
  }
}

class CounterDecrementButton extends ConsumerWidget {
  const CounterDecrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(stateProvider.notifier).decrement();
      },
    );
  }
}

class CounterResetButton extends ConsumerWidget {
  const CounterResetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(stateProvider.notifier).state = 0;
      },
    );
  }
}
