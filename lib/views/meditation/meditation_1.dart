import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/constants/app_images.dart';

class Meditation1 extends StatefulWidget {
  const Meditation1({super.key});

  @override
  State<Meditation1> createState() => _Meditation1State();
}

class _Meditation1State extends State<Meditation1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        width: size.width * 0.65,
        backgroundColor: AppColors.mainColor,
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: 30, color: AppColors.mainColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: Colors.white54),
            ),
            ListTile(
              leading: Icon(Icons.self_improvement, color: Colors.white),
              title: Text(
                "Meditation",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Meditation1()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Hi! Tithi Shah",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top meditation program for you",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _meditationCard(
                  size: size,
                  image: AppImages.med1,
                  title: "Let it go",
                  subTitle: "Don't Judge Yourself",
                  totalDuration: "32 min",
                  noOfTracks: 8,
                  duration: 2),
              SizedBox(height: 20),
              Text(
                "Meditation paths for you",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Text("Recommended"),
              ),
              SizedBox(height: 20),
              _meditationCard(
                  size: size,
                  title: "What is meditation",
                  subTitle: "From conflict to harmony",
                  step: "step 1",
                  totalDuration: "10 min",
                  noOfTracks: 4,
                  duration: "1 min",
                  image: AppImages.med2),
              SizedBox(height: 20),
              _meditationCard(
                  size: size,
                  title: "Learn to sit",
                  subTitle: "Discover the art of stillness",
                  step: "step 2",
                  totalDuration: "14 min",
                  noOfTracks: 5,
                  duration: "2 min",
                  image: AppImages.med3)
            ],
          ),
        ),
      ),
    );
  }

  Container _meditationCard(
      {required Size size,
      required image,
      required title,
      required subTitle,
      required totalDuration,
      required noOfTracks,
      required duration,
      step = ""}) {
    return Container(
      height: size.height / 4,
      width: size.width,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          Text(
            subTitle,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            step,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.play_arrow_rounded),
              ),
              SizedBox(width: 5),
              Text(
                "Play",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  totalDuration,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.headphones),
              SizedBox(width: 5),
              Text(
                "$noOfTracks tracks",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 10),
              Icon(Icons.collections_bookmark_outlined),
              Text(
                "$duration read",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
