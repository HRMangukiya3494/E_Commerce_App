import 'package:ecommerce_app/controller/ForgetController.dart';
import 'package:ecommerce_app/view/routes/AppRoutes.dart';
import 'package:ecommerce_app/view/utils/ColorUtils.dart';
import 'package:ecommerce_app/view/utils/ImgUtils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotController controller = Get.put(
      ForgotController(),
    );

    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.24,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    ImagePath + ForgetVector,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(h * 0.02),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: h * 0.028,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Enter the email associated with your account and we’ll send an email to reset your password.",
                          style: TextStyle(
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Email Address",
                                style: TextStyle(
                                  fontSize: h * 0.022,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                  fontSize: h * 0.022,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your email...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(h * 0.01)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(h * 0.01)),
                            ),
                            errorStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                controller
                                    .sendForgotPassword(emailController.text);
                              }
                            },
                            child: Container(
                              height: h * 0.08,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorUtils.primaryColor,
                                borderRadius: BorderRadius.circular(h * 0.02),
                              ),
                              child: Center(
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator(
                                        color: Colors.black)
                                    : Text(
                                        "SEND MAIL",
                                        style: TextStyle(
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: h * 0.01),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Back to ",
                                  style: TextStyle(
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.offAllNamed(AppRoutes.SIGNIN);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
