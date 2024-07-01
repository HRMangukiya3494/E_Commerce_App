import 'package:ecommerce_app/controller/ForgetVerificationController.dart';
import 'package:ecommerce_app/view/routes/AppRoutes.dart';
import 'package:ecommerce_app/view/utils/ColorUtils.dart';
import 'package:ecommerce_app/view/utils/ImgUtils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ForgotVerificationPage extends StatelessWidget {
  final ForgotVerificationController controller = Get.put(
    ForgotVerificationController(),
  );

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
                    ImagePath + ForgotVerificationVector,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(h * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Code",
                        style: TextStyle(
                          fontSize: h * 0.028,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "An Authentication Code Has Sent To \n${controller.email}",
                        style: TextStyle(
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: h * 0.03),
                      PinInputTextField(
                        pinLength: 4,
                        autoFocus: true,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        decoration: UnderlineDecoration(
                          textStyle: TextStyle(
                            fontSize: h * 0.026,
                            color: Colors.black,
                          ),
                          colorBuilder: PinListenColorBuilder(
                            Colors.white,
                            Colors.grey,
                          ),
                        ),
                        onChanged: (pin) {
                          if (pin.length == 4) {
                            controller.verifyOTP(pin);
                          }
                        },
                      ),
                      SizedBox(height: h * 0.03,),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "If you don’t receive code! ",
                                style: TextStyle(
                                  fontSize: h * 0.018,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "Resend",
                                style: TextStyle(
                                  fontSize: h * 0.018,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.resendOTP();
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.01),
                      GestureDetector(
                        onTap: () {
                          // Navigate to new password page
                          Get.toNamed(AppRoutes.NEW_PASSWORD);
                        },
                        child: Obx(() {
                          return Container(
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
                          );
                        }),
                      ),
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
          ],
        ),
      ),
    );
  }
}
