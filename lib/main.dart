import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity/mainScreens/bottomNavigationScreen.dart';
import 'package:infinity/mainScreens/homeScreen.dart';
import './mainScreens/detailScreen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'infinity',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: BottomNavigationScreen(),
    );
  }
}
