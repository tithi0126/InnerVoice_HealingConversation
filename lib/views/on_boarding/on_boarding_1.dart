import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/on_boarding/on_boarding_2.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
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
                  image: AssetImage(AppImages.onBoarding1), fit: BoxFit.cover)),
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
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("STEP 1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]))),
                    SizedBox(height: 10),
                    Text("Personalize Your Mental\nHealth State With AI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) => FirstPage()));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OnBoarding2()));
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

class CustomClipperCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
