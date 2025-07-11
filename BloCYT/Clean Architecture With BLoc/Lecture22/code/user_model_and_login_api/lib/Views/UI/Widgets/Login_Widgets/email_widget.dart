import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const EmailWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      focusNode: passwordFocusNode,
      decoration: const InputDecoration(
        hintText: 'email',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Email';
        }
        return null;
      },
      onFieldSubmitted: (value) {},
    );
  }
}
