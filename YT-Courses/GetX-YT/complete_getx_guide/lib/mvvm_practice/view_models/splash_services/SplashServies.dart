import 'dart:async';

import 'package:get/get.dart';
import 'package:getxdemo/mvvm_practice/resources/App_Routes/routes_names.dart';
import 'package:getxdemo/mvvm_practice/view_models/controller/user_preferences/user_preferences_model.dart';

class Splashservies {
  userPreference userP = userPreference();

  void isLogin() {
    userP.GetUser().then((value) {
      if (value.isLogin == false || value.isLogin.toString() == "null") {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesNames.loginScreenRoute));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesNames.homeScreenRoute));
      }
    });
  }
}
