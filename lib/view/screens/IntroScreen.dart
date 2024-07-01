import 'package:ecommerce_app/view/routes/AppRoutes.dart';
import 'package:ecommerce_app/view/utils/ColorUtils.dart';
import 'package:ecommerce_app/view/utils/ImgUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {}
    if (_currentPage == 2) {
      Get.offAllNamed(AppRoutes.SIGNIN);
    }
  }

  void _skip() {
    Get.offAllNamed(AppRoutes.SIGNIN);
  }

  Widget _buildPageIndicator(int index, height) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: height * 0.004,
      ),
      width: _currentPage == index ? height * 0.03 : height * 0.012,
      height: height * 0.012,
      decoration: _currentPage == index
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(
                height * 0.02,
              ),
              color: ColorUtils.primaryColor,
            )
          : const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                Padding(
                  padding: EdgeInsets.all(
                    h * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: h * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ImagePath + IntroVector1,
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        "Biggest Sell Of at your Clothing",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.026,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        "Find your best products from popular shop without any delay.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.02,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    h * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: h * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ImagePath + IntroVector2,
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        "Biggest Sell Of at your Clothing",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.026,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        "Find your best products from popular shop without any delay.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.02,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    h * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: h * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ImagePath + IntroVector3,
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        "Biggest Sell Of at your Clothing",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.026,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        "Find your best products from popular shop without any delay.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.02,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _skip,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: h * 0.018,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) => _buildPageIndicator(
                      index,
                      h,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _nextPage,
                  child: Container(
                    height: h * 0.04,
                    width: w * 0.16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        h * 0.01,
                      ),
                      color: ColorUtils.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: h * 0.016,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
