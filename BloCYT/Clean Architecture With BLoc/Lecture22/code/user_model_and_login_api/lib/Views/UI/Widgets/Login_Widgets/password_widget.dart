import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      focusNode: passwordFocusNode,
      decoration: const InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter password';
        }
        return null;
      },
      onFieldSubmitted: (value) {},
    );
  }
}
