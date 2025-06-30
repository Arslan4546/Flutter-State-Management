import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API with Riverpod')),
      body: Center(
        child: Text(
          'Welcome to the API with Riverpod example!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
