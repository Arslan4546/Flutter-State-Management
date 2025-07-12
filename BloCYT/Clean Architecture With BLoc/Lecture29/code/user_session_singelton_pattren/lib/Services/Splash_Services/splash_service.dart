import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen_practice/Configs/Routes/route_names.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.loginScreen,
        (route) => false,
      ),
    );
  }
}
