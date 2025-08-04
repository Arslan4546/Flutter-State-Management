import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/MVVM_Practice/view_models/splash_services/splash_servies.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      // appBar: AppBar(
      //   title: Text("Name".tr),
      // ),
      body: Center(
        child: Text(
          "Welcome".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   UtilsClass.toastMessageCenter("Error Successfully shown");
      // }),
    );
  }
}
