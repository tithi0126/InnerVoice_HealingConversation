import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/10_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class NinePage extends StatefulWidget {
  const NinePage({super.key});

  @override
  State<NinePage> createState() => _NinePageState();
}

class _NinePageState extends State<NinePage> {
  bool prescribed = false;
  bool limitedPeriod = false;
  bool notAtAll = true;
  String meds = "I'm not taking any";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BasicAssessment(
        question: "Are you taking any medications?",
        questionNo: 9,
        onPressed: () {
          (meds != "") ? log("Selected option: $meds") : log("not selected");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TenPage()));
        },
        customWidget: Wrap(children: [
          commonContainer(
              size: size,
              icon: AppImages.prescribed,
              text: "Prescribed medicines",
              value: prescribed),
          commonContainer(
              size: size,
              icon: AppImages.overTheCounter,
              text: "Over the Counter Supplements",
              value: limitedPeriod),
          commonContainer(
              size: size,
              icon: AppImages.pill,
              text: "I'm not taking any",
              value: notAtAll)
        ]));
  }

  GestureDetector commonContainer({
    required Size size,
    required String icon,
    required String text,
    required bool value,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          prescribed = text == "Prescribed medicines";
          limitedPeriod = text == "Over the Counter Supplements";
          notAtAll = text == "I'm not taking any";
          meds = text;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          height: size.width / 2.5,
          width: size.width / 2.5,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: value ? AppColors.mainColor : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon,
                  color: value ? Colors.white : AppColors.mainColor),
              Text(text,
                  style: TextStyle(
                      color: value ? Colors.white : AppColors.mainColor)),
            ],
          ),
        ),
      ),
    );
  }
}
