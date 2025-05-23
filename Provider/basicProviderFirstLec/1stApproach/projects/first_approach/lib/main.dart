import 'package:first_approach/counter.dart';
import 'package:first_approach/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // home: Provider<Student>(
      //   create: (context) {
      //     return Student();
      //   },
      //   child: const MyHomePage(title: 'Flutter Demo Home Page'),
      // ),
      home: ChangeNotifierProvider(
        create: (context) => Counter(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    // ager humm is listen ko true kryn gy to ye parents k tmam widgets ko listen able bna dy ga or ye hum ni chahty iss lyee iss ko humm ny false rakha hai
    Provider.of<Counter>(context, listen: false).increment();
  }

  @override
  Widget build(BuildContext context) {
    // var std = Provider.of<Student>(context);
    // print("Roll No: ${std.rollNo}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            // Basically we use consumer widget when we want to listen to the changes in the the Center of our UI
            //  its not the best approach to use Consumer widget in center of our ui but the best approach is to use it in the widget where we want to listen to the changes i mean in the separate file
            // But in this case we are using it in the center of our ui
            Consumer<Counter>(
              builder: (context, value, child) {
                return Text(
                  "${value.count}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
