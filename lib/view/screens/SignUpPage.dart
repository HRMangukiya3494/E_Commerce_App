import 'package:ecommerce_app/controller/SignupController.dart';
import 'package:ecommerce_app/view/routes/AppRoutes.dart';
import 'package:ecommerce_app/view/widgets/TextFormField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/view/utils/ColorUtils.dart';
import 'package:ecommerce_app/view/utils/ImgUtils.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = Get.put(
    SignUpController(),
  );

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    ImagePath + SignupVetor,
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
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Your Account",
                          style: TextStyle(
                            fontSize: h * 0.028,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Welcome back! Please enter your details",
                          style: TextStyle(
                            fontSize: h * 0.018,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        BuildTextField(
                            h,
                            "Name",
                            "*",
                            controller.nameController,
                            "Enter your name...", (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length < 3) {
                            return 'Name must be at least 3 characters';
                          }
                          return null;
                        }),
                        SizedBox(height: h * 0.03),
                        BuildTextField(
                            h,
                            "Mobile No",
                            "*",
                            controller.phoneController,
                            "Enter mobile number...", (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          final RegExp mobileRegExp = RegExp(r'^[0-9]{10}$');
                          if (!mobileRegExp.hasMatch(value)) {
                            return 'Please enter a valid 10-digit mobile number';
                          }
                          return null;
                        }),
                        SizedBox(height: h * 0.03),
                        BuildTextField(
                            h,
                            "Email Address",
                            "*",
                            controller.emailController,
                            "Enter your email...", (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }),
                        SizedBox(height: h * 0.03),
                        BuildTextField(
                            h,
                            "Password",
                            "*",
                            controller.passwordController,
                            "Enter your password...", (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid password';
                          }
                          if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid password with at least 6 characters, including 1 uppercase, 1 lowercase, 1 digit, and 1 special character.';
                          }
                          return null;
                        }),
                        SizedBox(height: h * 0.01),
                        Obx(() => Row(
                          children: [
                            Checkbox(
                              value: controller.isChecked.value,
                              onChanged: (bool? value) {
                                controller.isChecked.value = value!;
                              },
                            ),
                            Text(
                              "I agree to all terms, privacy and fees",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.018,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        )),
                        SizedBox(height: h * 0.02),
                        GestureDetector(
                          onTap: controller.signUp,
                          child: Container(
                            height: h * 0.08,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorUtils.primaryColor,
                              borderRadius: BorderRadius.circular(h * 0.02),
                            ),
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
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
