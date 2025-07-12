import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_practice/stateNotifier.dart';

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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                print("toggle text showed");
                final toggle = ref.watch(
                  searchProvider.select((state) => state.isChanged),
                );
                // This will rebuild the widget when the isChanged value changes
                return Switch(
                  value: toggle,
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).onChange(value);
                  },
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final text = ref.watch(
                  searchProvider.select((state) => state.search),
                );
                print("search text showed");
                return Text(
                  text,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            TextFormField(
              onChanged: (value) {
                ref.read(searchProvider.notifier).search(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            // Here you can add your widgets to display the state
          ],
        ),
      ),
    );
  }
}

// this is the code we use with the single search notifier in the stateNotifier.dart file

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Flutter Demo Home Page')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Consumer(
//               builder: (context, ref, child) {
//                 final text = ref.watch(searchProvider);
//                 return Text(
//                   text,
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 );
//               },
//             ),
//             TextFormField(
//               onChanged: (value) {
//                 ref.read(searchProvider.notifier).search(value);
//               },
//               decoration: const InputDecoration(
//                 labelText: 'Search',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             // Here you can add your widgets to display the state
//           ],
//         ),
//       ),
//     );
//   }
// }
