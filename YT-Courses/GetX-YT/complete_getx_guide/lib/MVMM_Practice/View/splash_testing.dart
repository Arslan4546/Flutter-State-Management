import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxdemo/MVMM_Practice/resources/App_Components/internet_exception_widget.dart';

class SplashS extends StatefulWidget {
  const SplashS({super.key});

  @override
  State<SplashS> createState() => _SplashSState();
}

class _SplashSState extends State<SplashS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Internet Exception",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: InternetExceptionWidget(
        onPressed: () {},
      ),
    );
  }
}
