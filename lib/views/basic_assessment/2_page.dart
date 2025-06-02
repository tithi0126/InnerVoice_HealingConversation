import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/3_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BasicAssessment(
        question: "What's your Gender?",
        questionNo: 2,
        onPressed: () {
          log(gender);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ThirdPage()));
        },
        customWidget: Column(children: [
          genderOption(
              size: size,
              text: 'I am Male',
              image: AppImages.male,
              icon: Icons.male,
              genderIn: "Male"),
          SizedBox(height: 20),
          genderOption(
              size: size,
              text: 'I am Female',
              image: AppImages.female,
              icon: Icons.female,
              genderIn: "Female"),
          SizedBox(height: 20),
          Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color(0xffE5EAD7),
              child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Prefer to skip, thanks",
                          style: TextStyle(
                              color: Color(0xff9BB168),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.close, color: Color(0xff9BB168))
                      ])))
        ]));
  }

  GestureDetector genderOption(
      {required Size size,
      required String text,
      required image,
      required icon,
      required String genderIn}) {
    return GestureDetector(
        onTap: () {
          setState(() {
            gender = genderIn;
          });
        },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: AppColors.background,
            child: Container(
                height: size.height / 4,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: (gender == genderIn)
                        ? Border.all(color: AppColors.mainColor)
                        : null,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text,
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(icon)
                        ],
                      ),
                      SvgPicture.asset(image, width: size.width / 2)
                    ]))));
  }
}
