import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routename='Splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/splash_screen.png'),
      ),
    );
  }
}