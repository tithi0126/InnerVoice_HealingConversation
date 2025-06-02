import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_images.dart';
import 'package:innervoice/views/home_screen.dart';
import 'package:innervoice/views/on_boarding/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      await Future.delayed(const Duration(seconds: 3));

      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              isLoggedIn ? const HomeScreen() : const WelcomeScreen(),
          //   LoginScreen
        ),
      );
    } catch (e) {
      debugPrint("Error fetching login status: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: appLogo(),
      ),
    );
  }

  Image appLogo() {
    return Image.asset(AppImages.appLogo1);
  }
}
