import 'dart:async';

import 'package:get/get.dart';
import 'package:getxdemo/MVMM_Practice/resources/App_Routes/routes_names.dart';
import 'package:getxdemo/MVMM_Practice/view_models/controller/user_preferences_model.dart';

class SplashServices {
  UserPreferencesModel userP = UserPreferencesModel();

  void isLogin() {
    userP.getUser().then((value) {
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
