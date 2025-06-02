import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/login_screen.dart';
import 'package:innervoice/views/on_boarding/on_boarding_1.dart';
import 'package:innervoice/widgets/common_submit_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome to InnerVoice",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            "Your mindful mental health companion for everyone, anywhere 🍃",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.mainColor, fontSize: 18),
          ),
          SizedBox(height: 30),
          SvgPicture.asset(AppImages.welcome),
          SizedBox(height: 10),
          SizedBox(
            width: size.width / 2,
            child: CommonSubmitButton(
                buttonText: "Get Started",
                suffixIcon: SvgPicture.asset(AppImages.rightArrow),
                onPressed: () {
                  //   OnBoarding1
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OnBoarding1(),
                      barrierDismissible: true));
                }),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginScreen(), barrierDismissible: true));
        },
        child: RichText(
          textAlign: TextAlign.center,
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
}
