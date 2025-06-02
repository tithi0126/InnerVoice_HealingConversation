import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/on_boarding/on_boarding_4.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
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
                  image: AssetImage(AppImages.onBoarding3), fit: BoxFit.cover)),
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
                            color: Color(0xffFFEBC2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("STEP 3",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffE0A500)))),
                    SizedBox(height: 10),
                    Text("Mindful Resources That \n Makes You Happy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OnBoarding4()));
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
