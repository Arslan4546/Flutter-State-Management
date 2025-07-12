import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}
// this is the constant provider that we use as a practice

// final globalProvider = Provider<String>((ref) {
//   return 'Hello, Riverpod!';
// });

// this is the counter state provider
final counterProvider = StateProvider<int>((ref) {
  return 0;
});
// this is the switch state provider
final switchProvider = StateProvider<bool>((ref) {
  return false;
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(title: 'Flutter Demo', home: const MyHomePage()),
    );
  }
}
// stateful widget k sath krny ka ye faida hai k iss mai flutte k life cycle ko ap achy sy manage kr skty hain

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // this is the best approach because it only rebuilds the Text widget
          // and not the whole widget tree
          // because consumer is itelf have a builder method
          // so it only rebuilds the Text widget when the counterProvider changes
          Consumer(
            builder: (context, ref, child) {
              final result = ref.watch(counterProvider);
              return Text(
                result.toString(),
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            child: const Text('Increment'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
            child: const Text('Decrement'),
          ),
          Consumer(
            builder: (context, ref, child) {
              final switchValue = ref.watch(switchProvider);
              return Switch(
                value: switchValue,
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
// ye sara stateless widget k sath kia tha humm ny ye b theek according to your need
// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print("rebuilding home page ");
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // this is the best approach because it only rebuilds the Text widget
//           // and not the whole widget tree
//           // because consumer is itelf have a builder method
//           // so it only rebuilds the Text widget when the counterProvider changes
//           Consumer(
//             builder: (context, ref, child) {
//               final result = ref.watch(counterProvider);
//               return Text(
//                 result.toString(),
//                 style: const TextStyle(fontSize: 24),
//               );
//             },
//           ),
//           ElevatedButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).state++;
//             },
//             child: const Text('Increment'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).state--;
//             },
//             child: const Text('Decrement'),
//           ),
//           Consumer(
//             builder: (context, ref, child) {
//               final switchValue = ref.watch(switchProvider);
//               return Switch(
//                 value: switchValue,
//                 onChanged: (value) {
//                   ref.read(switchProvider.notifier).state = value;
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final message = ref.watch(globalProvider);
//     return Center(child: Text(message));
//   }
// }

// this is not the best approach becuase it rebuilds the whole widget tree
// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final result = ref.watch(counterProvider);
//     final switchValue = ref.watch(switchProvider);
//     print("rebuilding home page ");
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(result.toString()),
//           ElevatedButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).state++;
//             },
//             child: const Text('Increment'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).state--;
//             },
//             child: const Text('Decrement'),
//           ),
//           Switch(
//             value: switchValue,
//             onChanged: (value) {
//               ref.read(switchProvider.notifier).state = value;
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
