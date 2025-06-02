import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/views/basic_assessment/8_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class SevenPage extends StatefulWidget {
  const SevenPage({super.key});

  @override
  State<SevenPage> createState() => _SevenPageState();
}

class _SevenPageState extends State<SevenPage> {
  String selectedOption = "No Pain";

  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
        question: "Are you experiencing any physical distress?",
        questionNo: 7,
        onPressed: () {
          log(selectedOption);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EightPage()));
          // EightPage
        },
        customWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildSelectableCard(
                  title: "Yes, one or multiple",
                  description:
                      "I'm experiencing physical pain in different places over my body.",
                  isSelected: selectedOption == "Yes",
                  onTap: () {
                    setState(() {
                      selectedOption = "Yes";
                    });
                  },
                  icon: Icons.close),
              SizedBox(height: 20),
              buildSelectableCard(
                  title: "No Physical Pain At All",
                  description:
                      "I'm not experiencing any physical pain in my body at all :)",
                  isSelected: selectedOption == "No Pain",
                  onTap: () {
                    setState(() {
                      selectedOption = "No Pain";
                    });
                  },
                  icon: Icons.check)
            ])));
  }

  Widget buildSelectableCard({
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: isSelected ? AppColors.mainColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2)
                ]),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xff90C2E0),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.black87, size: 24)),
              SizedBox(width: 15),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(description,
                        style: TextStyle(
                            fontSize: 16,
                            color:
                                isSelected ? Colors.white70 : Colors.black54))
                  ])),
              Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected ? Colors.white : Colors.black54)
            ])));
  }
}
