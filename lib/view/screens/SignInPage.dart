import 'package:ecommerce_app/view/utils/ColorUtils.dart';
import 'package:ecommerce_app/view/utils/ImgUtils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    ImagePath + SigninVector,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
           Expanded(child: SingleChildScrollView(child:  Padding(
             padding: EdgeInsets.all(
               h * 0.02,
             ),
             child: Form(
               key: _formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     "Sign In To Your Account",
                     style: TextStyle(
                       fontSize: h * 0.028,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   Text(
                     "welcome Back You’ve Been Missed!",
                     style: TextStyle(
                       fontSize: h * 0.02,
                       fontWeight: FontWeight.normal,
                       color: Colors.grey,
                     ),
                   ),
                   SizedBox(
                     height: h * 0.03,
                   ),
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
                   SizedBox(
                     height: h * 0.01,
                   ),
                   TextFormField(
                     controller: emailController,
                     onChanged: (value) {},
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
                         borderSide: const BorderSide(
                           color: Colors.black,
                         ),
                         borderRadius: BorderRadius.all(
                           Radius.circular(
                             h * 0.01,
                           ),
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderSide: const BorderSide(
                           color: Colors.black,
                         ),
                         borderRadius: BorderRadius.all(
                           Radius.circular(
                             h * 0.01,
                           ),
                         ),
                       ),
                       errorStyle: const TextStyle(
                         color: Colors.red,
                       ),
                     ),
                   ),
                   SizedBox(
                     height: h * 0.03,
                   ),
                   Text.rich(
                     TextSpan(
                       children: [
                         TextSpan(
                           text: "Password",
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
                   SizedBox(
                     height: h * 0.01,
                   ),
                   TextFormField(
                     controller: passwordController,
                     onChanged: (value) {},
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'Please enter a valid password';
                       }
                       if (!RegExp(
                           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                           .hasMatch(value)) {
                         return 'Please enter a valid password with at least 6 characters, including 1 uppercase, 1 lowercase, 1 digit, and 1 special character.';
                       }
                       return null;
                     },
                     decoration: InputDecoration(
                       hintText: 'Enter your password...',
                       hintStyle: const TextStyle(color: Colors.grey),
                       focusedBorder: OutlineInputBorder(
                         borderSide: const BorderSide(
                           color: Colors.black,
                         ),
                         borderRadius: BorderRadius.all(
                           Radius.circular(
                             h * 0.01,
                           ),
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderSide: const BorderSide(
                           color: Colors.black,
                         ),
                         borderRadius: BorderRadius.all(
                           Radius.circular(
                             h * 0.01,
                           ),
                         ),
                       ),
                       errorStyle: const TextStyle(
                         color: Colors.red,
                       ),
                     ),
                   ),
                   SizedBox(
                     height: h * 0.01,
                   ),
                   Row(
                     children: [
                       const Spacer(),
                       InkWell(
                         onTap: () {
                           Navigator.of(context).pushNamed('ForgotPage');
                         },
                         child: Text(
                           "Forgot Password?",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: h * 0.022,
                             color: Colors.black,
                           ),
                           textAlign: TextAlign.end,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(
                     height: h * 0.04,
                   ),
                   GestureDetector(
                     onTap: () {
                       if (_formKey.currentState!.validate()) {
                         // Form is valid, continue with your logic
                       }
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
                           "SIGN IN",
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
                             text: "Not a Member? ",
                             style: TextStyle(
                               fontSize: h * 0.018,
                               fontWeight: FontWeight.normal,
                               color: Colors.black,
                             ),
                           ),
                           TextSpan(
                             text: "Create an account",
                             style: TextStyle(
                               fontSize: h * 0.018,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                             recognizer: TapGestureRecognizer()
                               ..onTap = () {
                                 Navigator.of(context).pushNamed('SignupPage');
                               },
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),),),
          ],
        ),
      ),
    );
  }
}
