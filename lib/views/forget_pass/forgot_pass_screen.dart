import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/forget_pass/otp_screen.dart';
import 'package:innervoice/widgets/common_submit_button.dart';
import 'package:innervoice/widgets/custom_container_clipper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.background,
        body: Column(children: [
          _brainDesign(size),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _backIcon(context),
                    SizedBox(height: 20),
                    Text(
                      "Forgot Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Select contact details where you want to reset your password.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    // Spacer(),
                    SizedBox(height: 20),
                    _otpButton(),
                    _googleAuthentication(),
                    // Spacer(),
                    SizedBox(height: 20),
                    CommonSubmitButton(
                        buttonText: "Send Password",
                        suffixIcon: SvgPicture.asset(
                          AppImages.lock,
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(),
                              ));
                        })
                  ]))
        ]));
  }

  Stack _brainDesign(Size size) {
    return Stack(children: [
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
          ))
    ]);
  }

  GestureDetector _googleAuthentication() {
    return GestureDetector(
        onTap: () {},
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70),
                side: BorderSide(
                    width: 1,
                    color: AppColors.mainColor,
                    style: BorderStyle.solid)),
            color: Colors.white,
            elevation: 5,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImages.googleAuthIcon),
                      Text(
                        "Google Authenticator",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ]))));
  }

  GestureDetector _otpButton() {
    return GestureDetector(
        onTap: () {
          _showAlertDialog(context);
        },
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70),
                side: BorderSide(
                    width: 1,
                    color: AppColors.mainColor,
                    style: BorderStyle.solid)),
            color: Colors.white,
            elevation: 5,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImages.otpIcon),
                      Text(
                        "One Time Password",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ]))));
  }

  Row _backIcon(BuildContext context) {
    return Row(children: [
      GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    AppImages.backArrow,
                    height: 24,
                    width: 24,
                  ))))
    ]);
  }

  void _showAlertDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.white,
              child: SizedBox(
                  height: size.height * 0.60,
                  width: size.width * 0.75,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 250,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: SvgPicture.asset(AppImages.otpImage),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "We’ve sent the OTP to your email account tithi******@gmail.com",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Didn’t receive? Then re-send the password below! 🔑",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            Spacer(),
                            CommonSubmitButton(
                                buttonText: "Send Password",
                                suffixIcon: SvgPicture.asset(
                                  AppImages.lock,
                                  height: 24,
                                  width: 24,
                                  color: Colors.white,
                                ),
                                onPressed: () {})
                          ]))));
        });
  }
}
