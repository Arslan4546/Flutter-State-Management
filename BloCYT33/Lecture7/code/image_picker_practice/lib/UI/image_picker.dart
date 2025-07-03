import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implement image picking functionality here
          },
          child: const Text('Pick an Image'),
        ),
      ),
    );
  }
}
