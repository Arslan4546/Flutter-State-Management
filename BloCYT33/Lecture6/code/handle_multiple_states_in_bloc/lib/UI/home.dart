import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: true,
              onChanged: (value) {
                // Handle switch change
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 200, height: 200, color: Colors.blue),
            ),
            Slider(
              value: 0.5,
              onChanged: (value) {
                // Handle slider change
              },
            ),
          ],
        ),
      ),
    );
  }
}
