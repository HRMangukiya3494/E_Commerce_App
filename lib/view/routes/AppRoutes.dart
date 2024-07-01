import 'package:ecommerce_app/view/screens/ForgotPage.dart';
import 'package:ecommerce_app/view/screens/ForgotVerificationPage.dart';
import 'package:ecommerce_app/view/screens/HomePage.dart';
import 'package:ecommerce_app/view/screens/IntroScreen.dart';
import 'package:ecommerce_app/view/screens/NewPasswordPage.dart';
import 'package:ecommerce_app/view/screens/SignInPage.dart';
import 'package:ecommerce_app/view/screens/SignUpPage.dart';
import 'package:ecommerce_app/view/screens/SplashScreen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String SPLASH = "/";
  static const String INTRO = "/intro";
  static const String SIGNIN = "/signin";
  static const String SIGNUP = "/signup";
  static const String FORGOT = "/forgot";
  static const String FORGOT_VERIFICATION = "/forgot_verification";
  static const String NEW_PASSWORD = "/new_password";
  static const String HOME = "/home";

  static final routes = [
    GetPage(
      name: SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: INTRO,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: SIGNIN,
      page: () =>  SignInPage(),
    ),
    GetPage(
      name: SIGNUP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: FORGOT,
      page: () => ForgotPage(),
    ),
    GetPage(
      name: FORGOT_VERIFICATION,
      page: () => ForgotVerificationPage(),
    ),
    GetPage(
      name: NEW_PASSWORD,
      page: () => const NewPasswordPage(),
    ),
    GetPage(
      name: HOME,
      page: () => const HomePage(),
    ),
  ];
}
