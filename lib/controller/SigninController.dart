import 'dart:convert';
import 'package:ecommerce_app/view/routes/AppRoutes.dart';
import 'package:ecommerce_app/view/utils/VarUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  var isLoading = false.obs;

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;

    var request = http.MultipartRequest('POST',
        Uri.parse('https://customize.brainartit.com/ecommerce/api/login'));
    request.fields.addAll({'email': email, 'password': password});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      if (data['code'] == 200 && data['status'] == 1) {
        VarUtils.id = data['data']['id'];
        VarUtils.name = data['data']['name'];
        Get.snackbar(
          'Success',
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.snackbar(
          'Failed',
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Oops...',
        response.reasonPhrase ?? 'Unknown error',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    isLoading.value = false;
  }
}
