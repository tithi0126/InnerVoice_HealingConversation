import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/login_screen.dart';
import 'package:innervoice/widgets/common_submit_button.dart';
import 'package:innervoice/widgets/common_text_field.dart';
import 'package:innervoice/widgets/custom_container_clipper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _brainDesign(size),
            SizedBox(height: 20),
            _signUpText(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  _emailField(),
                  SizedBox(height: 25),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  _passwordField(),
                  SizedBox(height: 25),
                  Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  _confirmPasswordField(),
                  SizedBox(height: 25),
                  _signUpButton(),
                  SizedBox(height: 40),
                  _loginText(context),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _loginText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(), barrierDismissible: true));
      },
      child: Center(
        child: RichText(
          text: TextSpan(
            text: "Already Have An Account?",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            children: [
              TextSpan(
                  text: "Sign In",
                  style: TextStyle(
                      color: Color(0xff90C2E0), fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  CommonSubmitButton _signUpButton() {
    return CommonSubmitButton(
        buttonText: "Sign Up",
        suffixIcon: SvgPicture.asset(
          AppImages.rightArrow,
          height: 24,
          width: 24,
        ),
        onPressed: () {});
  }

  CommonTextField _confirmPasswordField() {
    return CommonTextField(
      prefixIcon: Container(
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          AppImages.lock,
          height: 24,
          width: 24,
        ),
      ),
      hintText: "Enter your password...",
      suffixIcon: Container(
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          AppImages.eye,
          height: 24,
          width: 24,
        ),
      ),
    );
  }

  CommonTextField _passwordField() {
    return CommonTextField(
      prefixIcon: Container(
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          AppImages.lock,
          height: 24,
          width: 24,
        ),
      ),
      hintText: "Enter your password...",
      suffixIcon: Container(
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          AppImages.eye,
          height: 24,
          width: 24,
        ),
      ),
    );
  }

  CommonTextField _emailField() {
    return CommonTextField(
      prefixIcon: Container(
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          AppImages.email,
          height: 24,
          width: 24,
        ),
      ),
      hintText: "tithi@gmail.com",
    );
  }

  Center _signUpText() {
    return Center(
      child: Text(
        "Sign Up For Free",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Stack _brainDesign(Size size) {
    return Stack(
      children: [
        ClipPath(
          clipper: TopCurveClipper(),
          child: Container(
            height: size.height / 4.5,
            color: AppColors.mainColor,
          ),
        ),
        Positioned(
          top: size.height / 20,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImages.brain,
            height: size.height / 8,
          ),
        ),
      ],
    );
  }
}
