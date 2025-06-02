import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/11_page.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';

class TenPage extends StatefulWidget {
  const TenPage({super.key});

  @override
  State<TenPage> createState() => _TenPageState();
}

class _TenPageState extends State<TenPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _chips = [];
  final FocusNode _focusNode = FocusNode();

  void _onSubmitted() {
    String value = _controller.text.trim();
    if (value.isNotEmpty) {
      setState(() {
        if (_chips.length < 10) {
          _chips.add(value);
          _controller.clear();
        } else {
          log("limit reached");
        }
      });
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
        question: "How would you describe yourself?",
        questionNo: 10,
        onPressed: () {
          log(_chips.toString());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ElevenPage()));
        },
        customWidget:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SvgPicture.asset(AppImages.heartWithHands, height: 200, width: 200),
          SizedBox(height: 50),
          _traitCard(),
          SizedBox(height: 50)
        ]));
  }

  Card _traitCard() {
    return Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.mainColor)),
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: _chips.map((chipText) {
                    return Chip(
                        label: Text(chipText,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        backgroundColor: Color(0xffF9D7C8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () {
                          setState(() {
                            _chips.remove(chipText);
                          });
                        });
                  }).toList()),
              TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                      counter: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.text_snippet_rounded),
                            Text("${_chips.length}/10")
                          ]),
                      hintText: "Describe yourself here",
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  textInputAction: TextInputAction.done,
                  onEditingComplete: _onSubmitted,
                  onChanged: (text) {
                    if (text.endsWith(',')) {
                      _controller.text =
                          text.replaceAll(',', ''); // Remove comma
                      _onSubmitted(); // Convert to chip
                    }
                    setState(() {}); // Update counter dynamically
                  })
            ])));
  }
}
