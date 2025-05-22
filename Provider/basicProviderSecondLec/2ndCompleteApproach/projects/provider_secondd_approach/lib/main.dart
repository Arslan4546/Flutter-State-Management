import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_secondd_approach/counter.dart';
import 'package:provider_secondd_approach/counter_text.dart';
import 'package:provider_secondd_approach/floating_action_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // here you can also use multiProvider to use multiple providers
      // but the worst things is that the provider can provider the first similar data type data becasue it search
      // with the type of the data not the name of the data
      // mtlab ager huamin dosri string ko acccess krna ho to ni kr pyn gy ye humain phli string he return kry ga badly mai q k ye type base search krta hai not data base
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter()),
          Provider<String>(
            create: (context) => "This is the first provider string",
          ),
          Provider<String>(
            create: (context) => "This is the second provider string",
          ),
        ],
        child: MyHomePage(title: "This is the best Approach/2nd of Provider"),
      ),
      // home: ChangeNotifierProvider(
      //   create: (context) => Counter(),
      //   child: const MyHomePage(title: "Provider Second / Best Approach"),
      // ),
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
  @override
  Widget build(BuildContext context) {
    var stringOfProvider = Provider.of<String>(context, listen: false);
    // this is the way to get the string from the provider
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(stringOfProvider), CounterText()],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(),
    );
  }
}
