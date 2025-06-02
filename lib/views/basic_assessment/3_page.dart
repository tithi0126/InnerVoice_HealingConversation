import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/views/basic_assessment/4_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int selectedAge = 18; // Default age selection

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BasicAssessment(
        question: "What's Your Age?",
        questionNo: 3,
        isSubmit: true,
        onPressed: () {
          log(selectedAge.toString());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FourthPage()));
        },
        customWidget:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 20),
          SizedBox(
              height: size.height / 2,
              child: ListWheelScrollView.useDelegate(
                  // controller: controller,
                  itemExtent: 100,
                  overAndUnderCenterOpacity: 0.75,
                  diameterRatio: 2,
                  physics: const FixedExtentScrollPhysics(),
                  useMagnifier: true,
                  magnification: 1.5,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      selectedAge = value;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 100,
                      builder: (context, index) {
                        bool isSelected = index == selectedAge;
                        return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: isSelected
                                  ? AppColors.mainColor
                                  : Colors.transparent,
                            ),
                            child: Text("$index",
                                style: TextStyle(
                                    // fontSize: isSelected ? 30 : 24,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey)));
                      })))
        ]));
  }
}
