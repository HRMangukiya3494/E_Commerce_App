import 'package:ecommerce_app/view/utils/ColorUtils.dart';
import 'package:flutter/material.dart';

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
  }

  void _skip() {
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
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
                Container(
                  color: Colors.red,
                  child: Center(
                      child: Text("Page 1", style: TextStyle(fontSize: 24))),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                      child: Text("Page 2", style: TextStyle(fontSize: 24))),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(
                      child: Text("Page 3", style: TextStyle(fontSize: 24))),
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
