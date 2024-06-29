import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
      Get.snackbar('Error', 'Checkbox Fill First...');
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

    if (response.statusCode == 200) {
      log(
        await response.stream.bytesToString(),
      );
    } else {
      log(
        response.reasonPhrase.toString(),
      );
    }
  }
}
