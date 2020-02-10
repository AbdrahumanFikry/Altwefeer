import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/bottomNavigationScreen.dart';
import './mainScreens/homeScreen.dart';
import './authScreens/SignUpScreen.dart';

void main() {
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
