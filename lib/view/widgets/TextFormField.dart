import 'package:flutter/material.dart';

Widget BuildTextField(
    double h,
    String label,
    String asterisk,
    TextEditingController controller,
    String hintText,
    String? Function(String?) validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                fontSize: h * 0.022,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: asterisk,
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
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(h * 0.01)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(h * 0.01)),
          ),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      ),
    ],
  );
}
