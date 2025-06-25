import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handling_multiple_provider_practice/provider.dart';

void main() {
  runApp(const MyApp());
}

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                final changeText = ref.watch(
                  appProvider.select((state) => state.isDark),
                );
                return InkWell(
                  onTap: () {
                    final currentState = ref.read(appProvider.notifier);
                    currentState.state = currentState.state.copyWith(
                      isDark: !changeText,
                    );
                  },
                  child: changeText
                      ? Text("Text is true")
                      : Text("Text is false"),
                );
              },
            ),

            SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final changeIcon = ref.watch(
                  appProvider.select((state) => state.showPassword),
                );
                return InkWell(
                  onTap: () {
                    final currentState = ref.read(appProvider.notifier);
                    currentState.state = currentState.state.copyWith(
                      showPassword: !changeIcon,
                    );
                  },
                  child: changeIcon ? Text("(Black)") : Text("(White)"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
