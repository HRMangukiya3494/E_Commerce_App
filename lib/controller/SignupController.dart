import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/view/utils/VarUtils.dart';

class SignUpController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var isChecked = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;
    if (!isChecked.value) {
      Get.snackbar('Error', 'Please agree to the terms and conditions.');
      return;
    }

    var request = http.MultipartRequest('POST',
        Uri.parse('https://customize.brainartit.com/ecommerce/api/register'));
    request.fields.addAll({
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'mobile': phoneController.text,
    });

    http.StreamedResponse response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(responseBody);
      if (jsonResponse['status'] == 1) {
        VarUtils.name = jsonResponse['data']['name'];
        VarUtils.email = jsonResponse['data']['email'];
        VarUtils.mobile = jsonResponse['data']['mobile'];
        VarUtils.id = jsonResponse['data']['id'];
        Get.snackbar(
          'Success',
          jsonResponse['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Failed',
          jsonResponse['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      log('Error: ${response.reasonPhrase}');
      Get.snackbar(
        'Failed',
        'Failed to register. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
