import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/views/basic_assessment/13_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class TwelvePage extends StatefulWidget {
  const TwelvePage({super.key});

  @override
  State<TwelvePage> createState() => _TwelvePageState();
}

class _TwelvePageState extends State<TwelvePage> {
  int stressLevel = 1;

  @override
  Widget build(BuildContext context) {
    List<String> sentance = [
      "Relaxed – Feeling calm and at ease.",
      "Mild Stress – Slightly tense but manageable.",
      "Moderate Stress – Noticeable pressure, but under control.",
      "High Stress – Feeling overwhelmed and anxious.",
      "Extreme Stress – Intense pressure, needing immediate relief."
    ];
    return BasicAssessment(
        question: "How would you rate your stress level?",
        questionNo: 12,
        onPressed: () {
          log("$stressLevel");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ThirteenPage()));
        },
        customWidget: Column(children: [
          Text("$stressLevel",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 180,
                  color: AppColors.mainColor)),
          levelSelector(),
          SizedBox(height: 20),
          Text(sentance[stressLevel - 1], textAlign: TextAlign.center),
          SizedBox(height: 20),
        ]));
  }

  Card levelSelector() {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      stressLevel = index + 1;
                    });
                  },
                  child: CircleAvatar(
                      backgroundColor: stressLevel == index + 1
                          ? AppColors.mainColor
                          : Colors.transparent,
                      radius: 30,
                      child: Text("${index + 1}",
                          style: TextStyle(
                              color: stressLevel == index + 1
                                  ? Colors.white
                                  : AppColors.mainColor,
                              fontSize: 24))));
            })));
  }
}
