import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity/Providers/cartProvider.dart';
import 'package:provider/provider.dart';
import './mainScreens/bottomNavigationScreen.dart';
import './mainScreens/cartScreen.dart';
import './mainScreens/homeScreen.dart';
import './mainScreens/detailScreen.dart';
import './mainScreens/addAddressScreen.dart';
import './mainScreens/addressBookScreen.dart';
import './mainScreens/paymentMethodScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitUp,
//  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'infinity',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
