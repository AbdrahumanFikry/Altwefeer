import 'package:flutter/material.dart';
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
        primarySwatch: Colors.white,
        primaryColor: Colors.black,
        hintColor: Colors.grey,
      ),
      home: SignUpScreen(),
    );
  }
}
