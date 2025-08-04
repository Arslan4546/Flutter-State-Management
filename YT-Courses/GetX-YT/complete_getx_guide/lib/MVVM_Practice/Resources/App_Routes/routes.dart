import 'package:get/get.dart';
import 'package:getxdemo/MVVM_Practice/Resources/App_Routes/routes_names.dart';
import 'package:getxdemo/MVVM_Practice/View/Splash/splash_screen.dart';
import 'package:getxdemo/MVVM_Practice/View/login/login.dart';
import 'package:getxdemo/without_mvvm/favoritePractice/homeScreen.dart';

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
