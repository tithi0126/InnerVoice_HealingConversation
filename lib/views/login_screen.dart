import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/1_page.dart';
import 'package:innervoice/views/forget_pass/forgot_pass_screen.dart';
import 'package:innervoice/views/home_screen.dart';
import 'package:innervoice/views/signup_screen.dart';
import 'package:innervoice/widgets/common_submit_button.dart';
import 'package:innervoice/widgets/common_text_field.dart';
import 'package:innervoice/widgets/custom_container_clipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // HomeScreen
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text("Test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _brainDesign(size),
            SizedBox(height: 20),
            signInText(),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  emailField(),
                  SizedBox(height: 25),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  passwordField(),
                  SizedBox(height: 25),
                  _signInButton(),
                  SizedBox(height: 20),
                  googleSignUp(),
                  SizedBox(height: 20),
                  signUpText(),
                  _forgotPassword()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Center _forgotPassword() {
    return Center(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForgotPasswordScreen()));
          },
          child: Text(
            "Forgot Password",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.mainColor),
          )),
    );
  }

  GestureDetector signUpText() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignupScreen()));
      },
      child: Center(
        child: RichText(
            text: TextSpan(
                text: "Don't have an account ?",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                children: [
              TextSpan(
                  text: "Sign Up",
                  style: TextStyle(
                      color: AppColors.mainColor, fontWeight: FontWeight.bold))
            ])),
      ),
    );
  }

  GestureDetector googleSignUp() {
    return GestureDetector(
      child: Center(
        child: CircleAvatar(
          backgroundColor: AppColors.greyColor,
          radius: 25,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              AppImages.googleLogo,
              height: 24,
              width: 24,
              color: AppColors.mainColor,
            ),
          ),
        ),
      ),
    );
  }

  CommonSubmitButton _signInButton() {
    return CommonSubmitButton(
      buttonText: 'Sign In',
      suffixIcon: SvgPicture.asset(
        AppImages.rightArrow,
        height: 24,
        width: 24,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstPage(),
          ),
        );
      },
    );
  }

  CommonTextField passwordField() {
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

  CommonTextField emailField() {
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

  Center signInText() {
    return Center(
        child: Text(
      "Sign In\nInner Voice",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ));
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
