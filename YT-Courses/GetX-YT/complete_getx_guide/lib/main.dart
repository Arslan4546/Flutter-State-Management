import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getxdemo/MVMM_Practice/View/home/home.dart';
import 'package:getxdemo/without_mvvm/LanguageTranslation/eng&urdu.dart';
import 'package:getxdemo/without_mvvm/LanguageTranslation/languages.dart';
import 'package:getxdemo/without_mvvm/expampletwo/TestingScreen.dart';
import 'package:getxdemo/without_mvvm/favoritePractice/homeScreen.dart';

import 'package:getxdemo/without_mvvm/height&widthPractice/height&width.dart';
import 'package:getxdemo/without_mvvm/loginApiPractice/mainScreen.dart';
import 'without_mvvm/Counter_Example/home.dart';
import 'without_mvvm/ThemePractice/dart&lightTheme.dart';
import 'without_mvvm/exampleThree/testScreen.dart';
import 'without_mvvm/imagePickerPractice/homeScreen.dart';

import 'MVMM_Practice/resources/App_Routes/routes.dart';
import 'MVMM_Practice/view/Splash/splash_screen.dart';
import 'MVMM_Practice/view/splash_testing.dart';
import 'MVMM_Practice/view/splash_another_testing.dart';
import 'without_mvvm/navigations&routes/screen1.dart';
import 'without_mvvm/navigations&routes/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenAPI(),
      //locale: const Locale("en", "US"),
      // locale: const Locale("en", "US"),
      // fallbackLocale: const Locale("en", "US"),
      // translations: Languages(),

      // getPages: [
      //   GetPage(name: "/S1", page: () => const Screen1()),
      //   GetPage(name: "/S2", page: () => Screen2()),
      // ],

      // getPages: AppRoutes.appRoutes(),
    );
  }
}
