import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/14_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class ThirteenPage extends StatefulWidget {
  const ThirteenPage({super.key});

  @override
  State<ThirteenPage> createState() => _ThirteenPageState();
}

class _ThirteenPageState extends State<ThirteenPage> {
  int selectedIndex = -1;

  final List emojis = [
    AppImages.excellentFace,
    AppImages.goodFace,
    AppImages.fairFace,
    AppImages.poorFace,
    AppImages.worstFace,
  ];

  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
        question: "Difficulty in Sleeping?",
        questionNo: 13,
        onPressed: () {
          //   FourteenPage
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FourteenPage()));
        },
        customWidget:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 20),
          Text(
            "You're not alone. Let's help you relax and unwind.",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 50),
          SvgPicture.asset(AppImages.confusedPerson),
          SizedBox(height: 50),
          _selectDifficultyLevel(),
          SizedBox(height: 40)
        ]));
  }

  Row _selectDifficultyLevel() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(emojis.length, growable: true, (index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  log(selectedIndex.toString());
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: selectedIndex == index
                          ? Border.all(color: Colors.black, width: 3)
                          : null),
                  child: SvgPicture.asset(emojis[index])));
        }));
  }
}
