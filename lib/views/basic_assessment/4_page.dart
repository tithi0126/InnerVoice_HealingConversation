import 'package:flutter/material.dart';
import 'package:innervoice/views/basic_assessment/5_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
        question: "What's Your Weight?",
        questionNo: 4,
        isSubmit: true,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FifthPage()));
        },
        customWidget: SizedBox());
  }
}
