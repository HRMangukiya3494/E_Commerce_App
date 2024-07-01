import 'package:ecommerce_app/controller/ForgetController.dart';
import 'package:ecommerce_app/view/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgotVerificationController extends GetxController {
  var isLoading = false.obs;
  late String email;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments as String;
  }

  Future<void> verifyOTP(String otp) async {
    isLoading.value = true;

    var url = Uri.parse('https://customize.brainartit.com/ecommerce/api/verify-password');
    var response = await http.post(
      url,
      body: {'otp': otp},
    );

    if (response.statusCode == 200) {
      Get.snackbar(
        'OTP Verified',
        'Password reset OTP verified successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offNamed(AppRoutes.NEW_PASSWORD);
    } else {
      Get.snackbar(
        'OTP Verification Failed',
        'Failed to verify OTP: ${response.reasonPhrase}',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isLoading.value = false;
  }

  Future<void> resendOTP() async {
    var forgotController = Get.find<ForgotController>();
    forgotController.sendForgotPassword(email);
  }
}
