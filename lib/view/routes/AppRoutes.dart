import 'package:ecommerce_app/view/screens/ForgotPage.dart';
import 'package:ecommerce_app/view/screens/ForgotVerificationPage.dart';
import 'package:ecommerce_app/view/screens/IntroScreen.dart';
import 'package:ecommerce_app/view/screens/NewPasswordPage.dart';
import 'package:ecommerce_app/view/screens/SignInPage.dart';
import 'package:ecommerce_app/view/screens/SignUpPage.dart';
import 'package:ecommerce_app/view/screens/SplashScreen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/intro', page: () => const IntroScreen()),
    GetPage(name: '/signin', page: () => const SignInPage()),
    GetPage(name: '/signup', page: () => SignUpPage()),
    GetPage(name: '/forgot', page: () => const ForgotPage()),
    GetPage(
        name: '/forgot_verification',
        page: () => const ForgotVerificationPage()),
    GetPage(name: '/new_password', page: () => const NewPasswordPage()),
  ];
}
