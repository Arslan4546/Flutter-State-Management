import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'general_button.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const InternetExceptionWidget({super.key, required this.onPressed});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            SizedBox(height: height * .15),
            const Icon(
              Icons.cloud_off,
              color: Colors.blue,
              size: 100,
            ),
            Center(
              child: Text(
                "Internet Exception",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * .15),
            RoundButtonWidget(
              width: 100,
              height: 50,
              title: "Retry",
              onPressed: () {},
            )
          ],
        ));
  }
}
