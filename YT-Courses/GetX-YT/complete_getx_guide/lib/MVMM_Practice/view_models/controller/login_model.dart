import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxdemo/mvvm_practice/Repositories/login_Repository.dart';
import 'package:getxdemo/without_mvvm/favoritePractice/homeScreen.dart';
import 'package:getxdemo/MVMM_Practice/Models/Login_Model/user_model.dart';
import 'package:getxdemo/MVMM_Practice/resources/App_Routes/routes.dart';
import 'package:getxdemo/MVMM_Practice/resources/App_Routes/routes_names.dart';
import 'package:getxdemo/MVMM_Practice/Utils/utils_file.dart';
import 'package:getxdemo/MVMM_Practice/view_models/controller/user_preferences_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  UserPreferencesModel userP = UserPreferencesModel();

  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  void login() {
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };
    loading = true.obs;

    _api.loginAPI(data).then((value) {
      if (value["error" == "user not found"]) {
        UtilsClass.snackBar("Login", value["error"]);
        loading = false.obs;
      } else {
        UserModel userModel = UserModel(
          isLogin: true,
          token: value["token"],
        );
        loading = false.obs;
        userP.saveUser(userModel).then((value) {
          Get.toNamed(RoutesNames.homeScreenRoute);
        });
      }
    }).onError((error, StackTrace) {
      loading = false.obs;
      UtilsClass.snackBar("Error", error.toString());
    });
  }
}
