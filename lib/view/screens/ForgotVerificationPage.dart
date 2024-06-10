import 'dart:developer';

import 'package:ecommerce_app/view/utils/ColorUtils.dart';
import 'package:ecommerce_app/view/utils/ImgUtils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ForgotVerificationPage extends StatefulWidget {
  const ForgotVerificationPage({super.key});

  @override
  State<ForgotVerificationPage> createState() => _ForgotVerificationPageState();
}

class _ForgotVerificationPageState extends State<ForgotVerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  String email = "abc@gmail.com";
  late TextEditingController _pinEditingController;

  void initState() {
    _pinEditingController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _pinEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
                  padding: EdgeInsets.all(
                    h * 0.02,
                  ),
                  child: Form(
                    key: _formKey,
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
                          "An Authentication Code Has Sent To \n$email",
                          style: TextStyle(
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        PinInputTextField(
                          pinLength: 4,
                          controller: _pinEditingController,
                          autoFocus: true,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          decoration: UnderlineDecoration(
                            textStyle: const TextStyle(color: Colors.white),
                            colorBuilder: PinListenColorBuilder( Colors.white,Colors.grey,),
                          ),
                          onChanged: (pin) {
                            if (pin.length == 6) {
                              try {
                                log("Received OTP: $pin");
                              } catch (e) {
                                log("$e");
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
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
                                  text: "Resent",
                                  style: TextStyle(
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {

                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                            }
                            Navigator.of(context).pushNamed('NewPasswordPage');
                          },
                          child: Container(
                            height: h * 0.08,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorUtils.primaryColor,
                              borderRadius: BorderRadius.circular(
                                h * 0.02,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "SEND MAIL",
                                style: TextStyle(
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
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
                                      Navigator.of(context)
                                          .pushNamed('SignInPage');
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
