import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/views/basic_assessment/basic_assessment.dart';
import 'package:innervoice/views/home_screen.dart';
import 'package:innervoice/widgets/common_submit_button.dart';

class FourteenPage extends StatefulWidget {
  const FourteenPage({super.key});

  @override
  State<FourteenPage> createState() => _FourteenPageState();
}

class _FourteenPageState extends State<FourteenPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasicAssessment(
      question: "Expression Analysis",
      questionNo: 14,
      onPressed: () {},
      isSubmit: false,
      customWidget:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 20),
        Text(
          "We are here to listen.",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 20),
        Card(
            elevation: 5,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.mainColor)),
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                maxLength: 250,
                decoration: InputDecoration(
                    hintText: "Describe yourself here",
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                textInputAction: TextInputAction.done,
              ),
            )),
        CommonSubmitButton(
          buttonText: "Submit",
          /*suffixIcon: SvgPicture.asset(
                AppImages.rightArrow,
                height: 24,
                width: 24,
              ),*/
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        )
      ]),
    );
  }
}
