import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meylin_avel/game_page.dart';
import 'package:meylin_avel/start_page.dart';
import 'package:vibration/vibration.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: StartPage()
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StartPage()));
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    String splashImage = useMobileLayout
        ? 'lib/assets/images/cover_meylin_avel_smartphone.jpg'
        : 'lib/assets/images/cover_meylin_avel_tablet.jpg';

    return Scaffold(
        body: Stack(
      children: [
        // Hintergrundbild
        Transform.scale(
          scale: 2.0, // Vergrößert das Bild um das 2-fache
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              splashImage,
              fit: BoxFit
                  .cover, // This is important as it allows the image to cover the entire screen
            ),
          ),
        ),
        // Logo
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child:
                Image.asset('lib/assets/images/logo_counter_game_200x206.png'),
          ),
        ),
      ],
    ));
  }
}
