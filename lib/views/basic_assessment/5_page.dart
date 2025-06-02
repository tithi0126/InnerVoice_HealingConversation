import 'package:flutter/material.dart';
import 'package:innervoice/views/basic_assessment/6_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
      customWidget: SizedBox(),
      question: "How would you describe your mood?",
      questionNo: 5,
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SixthPage()));
      },
    );
  }
}
