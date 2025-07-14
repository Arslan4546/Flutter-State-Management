import 'package:get/get.dart';
import 'package:getxdemo/without_mvvm/favoritePractice/homeScreen.dart';
import 'package:getxdemo/mvvm_practice/view/login/login_view.dart';
import 'package:getxdemo/mvvm_practice/resources/App_Routes/routes_names.dart';
import 'package:getxdemo/mvvm_practice/view/Splash.dart';
import 'package:getxdemo/mvvm_practice/view/home/home.dart';
import 'package:getxdemo/mvvm_practice/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesNames.splashScreenRoute,
          page: () => const Splash(),
          transitionDuration: const Duration(milliseconds: 12),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesNames.loginScreenRoute,
          page: () => const LoginView(),
          transitionDuration: const Duration(milliseconds: 12),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesNames.homeScreenRoute,
          page: () => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 12),
          transition: Transition.leftToRightWithFade,
        )
      ];
}
