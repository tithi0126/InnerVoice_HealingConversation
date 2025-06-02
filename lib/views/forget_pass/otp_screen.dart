import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/widgets/common_submit_button.dart';
import 'package:innervoice/widgets/common_text_field.dart';
import 'package:innervoice/widgets/custom_container_clipper.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
            child: Column(children: [
          _brainDesign(size),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Row(children: [
                  Text("Phone Number",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ]),
                _phoneField(),
                SizedBox(height: 20),
                _sendOtpButton(),
                SizedBox(height: 20),
                Text("Enter 4 digit OTP code",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                        fontSize: 24)),
                SizedBox(height: 10),
                Text(
                    "Scan your biometric fingerprint to make your account more secure.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 16)),
                _otpInput(),
                SizedBox(height: 20),
                CommonSubmitButton(
                    buttonText: "Continue",
                    suffixIcon: SvgPicture.asset(AppImages.rightArrow,
                        height: 24, width: 24),
                    onPressed: () {})
              ]))
        ])));
  }

  Pinput _otpInput() {
    return Pinput(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        defaultPinTheme: PinTheme(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 48,
                fontWeight: FontWeight.bold)),
        focusedPinTheme: PinTheme(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.otpActiveColor),
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold)),
        followingPinTheme: PinTheme(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 48,
                fontWeight: FontWeight.bold)),
        length: 4,
        controller: _otpController,
        validator: (value) {
          return null;
        },
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          debugPrint('onCompleted: $pin');
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              color: Colors.black,
              alignment: Alignment.center,
              width: 1,
              height: 20)
        ]));
  }

  ElevatedButton _sendOtpButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 7, horizontal: 24))),
        child: Text("Send OTP",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)));
  }

  CommonTextField _phoneField() {
    return CommonTextField(
        prefixIcon: Container(
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(AppImages.email, height: 24, width: 24)),
        hintText: "Phone number...");
  }

  Stack _brainDesign(Size size) {
    return Stack(children: [
      ClipPath(
          clipper: TopCurveClipper(),
          child:
              Container(height: size.height / 4.5, color: AppColors.mainColor)),
      Positioned(
          top: size.height / 20,
          left: 0,
          right: 0,
          child: Image.asset(AppImages.brain, height: size.height / 8))
    ]);
  }
}
