import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/views/basic_assessment/2_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  String healthGoal = "I want to reduce Stress";

  final List<Map<String, dynamic>> options = [
    {"icon": Icons.self_improvement, "text": "I want to reduce Stress"},
    {"icon": Icons.mood_bad, "text": "I want to overcome Depression"},
    {"icon": Icons.healing, "text": "I want to cope with Trauma"},
    {"icon": Icons.emoji_people, "text": "I want to be a better person"},
    {"icon": Icons.psychology, "text": "I want to reduce Anxiety"},
  ];

  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
        question: 'What’s your health goal?',
        questionNo: 1,
        onPressed: () {
          log(healthGoal);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondPage()));
        },
        customWidget: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: options.map((option) {
              bool isSelected = healthGoal == option["text"];
              return Card(
                  color: isSelected
                      ? AppColors.mainColor
                      : AppColors.textLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: isSelected ? 6 : 2,
                  shadowColor: isSelected ? Colors.black26 : Colors.grey[200],
                  child: RadioListTile<String>(
                      value: option["text"],
                      groupValue: healthGoal,
                      onChanged: (value) {
                        setState(() {
                          healthGoal = value!;
                        });
                      },
                      title: Row(children: [
                        Icon(option["icon"],
                            color: isSelected
                                ? AppColors.textLightColor
                                : AppColors.mainColor),
                        SizedBox(width: 12),
                        Expanded(
                            child: Text(option["text"],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? AppColors.textLightColor
                                        : AppColors.mainColor)))
                      ]),
                      controlAffinity: ListTileControlAffinity.trailing,
                      // Moves radio button to the right
                      activeColor: AppColors.textLightColor));
            }).toList()));
  }
}
