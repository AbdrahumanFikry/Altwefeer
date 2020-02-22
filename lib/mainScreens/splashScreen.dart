import 'dart:async';
import 'package:flutter/material.dart';
import '../mainScreens/bottomNavigationScreen.dart';
import '../widgets/pageRoute.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    Timer(
      Duration(milliseconds: 500),
      () {
        setState(() {
          _opacity = 1.0;
        });
      },
    );
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          FadeRoute(
            page: BottomNavigationScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: AssetImage(
              deviceWidth > 512
                  ? 'assets/images/splash.png'
                  : 'assets/images/splashBig.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            child: Image.asset(
              'assets/images/logo.png',
              width: deviceWidth > 512
                  ? MediaQuery.of(context).size.width * 0.6
                  : MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.cover,
            ),
            duration: Duration(
              seconds: 1,
            ),
            opacity: _opacity,
          ),
        ),
      ),
    );
  }
}
