import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/7_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({super.key});

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  String isSelected = "No";

  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
        customWidget: Column(children: [
          SvgPicture.asset(AppImages.sixthAssessment,
              width: MediaQuery.of(context).size.width),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            boolButton(answer: 'Yes'),
            SizedBox(width: 10),
            boolButton(answer: 'No')
          ]),
          SizedBox(height: 20)
        ]),
        question: "Have you sought professional help before?",
        questionNo: 6,
        onPressed: () {
          log(isSelected);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SevenPage()));
        });
  }

  Expanded boolButton({required String answer}) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                isSelected = answer;
              });
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: (isSelected == answer)
                    ? AppColors.mainColor
                    : Colors.white),
            child: Text(answer,
                style: TextStyle(
                    color: (isSelected == answer)
                        ? Colors.white
                        : AppColors.mainColor))));
  }
}
