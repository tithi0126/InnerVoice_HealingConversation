import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/9_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EightPage extends StatefulWidget {
  const EightPage({super.key});

  @override
  State<EightPage> createState() => _EightPageState();
}

class _EightPageState extends State<EightPage> {
  // double qwerty = 0;
  double _value = 0; // Default value (Poor)

  final List<String> labels = ["Worst", "Poor", "Fair", "Good", "Excellent"];
  final List<String> hours = [
    "<3 HOURS",
    "3-4 HOURS",
    "5 HOURS",
    "6-7 HOURS",
    "7-9 HOURS"
  ];

  final List<Color> colors = [
    Color(0xffE38B84), // Worst
    Color(0xffFFB6A3), // Poor
    Color(0xffF9D7C8), // Fair
    Color(0xffA8E4FE), // Good
    Color(0xff71C5F8), // Excellent
  ];
  final List emoji = [
    AppImages.worstFace,
    AppImages.poorFace,
    AppImages.fairFace,
    AppImages.goodFace,
    AppImages.excellentFace
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BasicAssessment(
        questionNo: 8,
        question: "How would you rate your seep quality?",
        onPressed: () {
          log(labels[_value.toInt()]);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NinePage()));
        },
        customWidget: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: SizedBox(
                    height: size.height / 2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(labels.length, (index) {
                          int reversedIndex = labels.length -
                              1 -
                              index; // Reverse index mapping
                          return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                labels[reversedIndex], // Use reversed index
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: reversedIndex == _value.toInt()
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                              subtitle: Text(hours[reversedIndex],
                                  // Use reversed index
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)));
                        })))),

            /// Center - Vertical Slider
            SizedBox(
                height: size.height / 2,
                child: SfSlider.vertical(
                    stepSize: 1,
                    min: 0,
                    max: 4,
                    value: _value,
                    interval: 1,
                    showLabels: false,
                    showTicks: false,
                    enableTooltip: false,
                    thumbIcon: Transform.scale(
                      scale: 2,
                      // Increase this value to make the thumb bigger
                      child: CircleAvatar(
                          backgroundColor: colors[_value.toInt()],
                          child: SvgPicture.asset(AppImages.upDownArrow,
                              height: 12)),
                    ),
                    activeColor: colors[_value.toInt()],
                    inactiveColor: Colors.grey[300],
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _value = newValue;
                      });
                    })),

            Expanded(
                child: SizedBox(
                    height: size.height / 2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(emoji.length, (index) {
                          int reversedIndex =
                              emoji.length - 1 - index; // Reverse index mapping
                          return ListTile(
                              contentPadding: EdgeInsets.zero,
                              trailing: SvgPicture.asset(emoji[reversedIndex]));
                        }))))
          ]),
          SizedBox(height: 50)
        ]));
  }
}
