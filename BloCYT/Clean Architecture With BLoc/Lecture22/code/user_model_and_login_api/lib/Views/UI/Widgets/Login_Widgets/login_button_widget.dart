import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {}
      },
      child: const Text('Login'),
    );
  }
}
