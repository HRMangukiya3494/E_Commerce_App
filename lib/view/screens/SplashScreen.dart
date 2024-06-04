import 'package:ecommerce_app/view/utils/ImgUtils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushNamedAndRemoveUntil('IntroScreen', (route) => false);
    });
    return Scaffold(
      body: Center(
        child: Container(
          height: h * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImagePath + SplashScreenImg,
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}