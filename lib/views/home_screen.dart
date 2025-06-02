import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';
import 'package:innervoice/views/meditation/meditation_1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
        centerTitle: true,
        title: Text("AppBar"),
        // automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thought of the Day !!",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                          '“It is better to conquer yourself than to win a thousand battles”')
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mental Health Metrics",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.more_vert, color: Colors.grey)
                ],
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      healthMetrics(
                          child: Column(children: [
                        Row(children: [
                          Icon(Icons.heart_broken, color: Colors.white),
                          Text("Heart Rate",
                              style: TextStyle(color: Colors.white))
                        ])
                      ])),
                      healthMetrics(
                          child: Column(children: [
                        Row(children: [
                          Icon(Icons.heart_broken, color: Colors.white),
                          Text("Freud Score",
                              style: TextStyle(color: Colors.white))
                        ])
                      ])),
                      healthMetrics(
                          child: Column(children: [
                        Row(children: [
                          Icon(Icons.tag_faces, color: Colors.white),
                          Text("Mood", style: TextStyle(color: Colors.white))
                        ])
                      ])),
                      healthMetrics(
                          child: Column(children: [
                        Row(children: [
                          Icon(Icons.medication, color: Colors.white),
                          Text("Health journal",
                              style: TextStyle(color: Colors.white))
                        ])
                      ]))
                    ],
                  )),
              Text("Snail dots"),
            ],
          ),
        ),
      ),
    );
  }

  Container healthMetrics({required Widget child}) {
    return Container(
      height: 200,
      width: 163,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.mainColor,
      ),
      child: child,
    );
  }
}
