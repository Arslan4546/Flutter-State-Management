import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/MVMM_Practice/resources/App_Components/general_button.dart';
import 'package:getxdemo/MVMM_Practice/Utils/utils_file.dart';
import 'package:getxdemo/MVMM_Practice/view_models/controller/login_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Text(
          "Login".tr,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        UtilsClass.snackBar("Email", "Enter your Email");
                      }
                    },
                    onFieldSubmitted: (value) {
                      UtilsClass.focusChange(
                        context,
                        loginVM.emailFocusNode.value,
                        loginVM.passwordFocusNode.value,
                      );
                    },
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    decoration: InputDecoration(
                      hintText: "Email".tr,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value!.isEmpty) {
                        UtilsClass.snackBar("Password", "Enter your Password");
                      }
                    },
                    controller: loginVM.passwordController.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    decoration: InputDecoration(
                        hintText: "Password".tr,
                        border: const OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundButtonWidget(
                buttonColor: Colors.teal,
                textColor: Colors.white,
                height: 50,
                width: 100,
                title: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  } else {}
                })
          ],
        ),
      ),
    );
  }
}
