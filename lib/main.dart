import 'dart:developer';
import 'package:ecommerce_app/view/screens/IntroScreen.dart';
import 'package:ecommerce_app/view/screens/SignInPage.dart';
import 'package:ecommerce_app/view/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize();
  try {
    // GoogleAdsHelper.googleAdsHelper.loadAppOpenAd();
  } catch (e) {
    log("$e");
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'SplashScreen',
      routes: {
        'SplashScreen': (context) => const SplashScreen(),
        'IntroScreen': (context) => const IntroScreen(),
        'SignInPage': (context) => const SignInPage(),
      },
    );
  }
}