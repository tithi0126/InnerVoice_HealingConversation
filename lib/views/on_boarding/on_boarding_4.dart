import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/basic_assessment/1_page.dart';

class OnBoarding4 extends StatefulWidget {
  const OnBoarding4({super.key});

  @override
  State<OnBoarding4> createState() => _OnBoarding4State();
}

class _OnBoarding4State extends State<OnBoarding4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.onBoarding4), fit: BoxFit.cover)),
          alignment: Alignment.bottomCenter),
      Positioned(
          height: size.height / 2.5,
          bottom: 0,
          width: size.width,
          child: ClipPath(
            // clipper: CustomClipperCurve(),
            child: Container(
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            color: Color(0xffCBC2FF),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("STEP 4",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7152FF)))),
                    SizedBox(height: 10),
                    Text("Loving % Supportive \n Community",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FirstPage()));
                      },
                      child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.black,
                          child: SvgPicture.asset(AppImages.rightArrow)),
                    ),
                  ]),
            ),
          ))
    ]));
  }
}
