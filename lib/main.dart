import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './authScreens/forgotPasswordScreen.dart';
import './Providers/cartProvider.dart';
import './authScreens/checkEmailScreen.dart';
import './authScreens/loginScreen.dart';
import './mainScreens/bottomNavigationScreen.dart';
import './mainScreens/homeScreen.dart';
import './mainScreens/orderPlacedSuccessfullyScreen.dart';
import './mainScreens/placeOrderScreen.dart';
import 'package:provider/provider.dart';
import './mainScreens/detailScreen.dart';
import './mainScreens/addAddressScreen.dart';
import './mainScreens/addressBookScreen.dart';
import './mainScreens/paymentMethodScreen.dart';

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
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'infinity',
        theme: ThemeData(
          primaryColor: Colors.grey,
        ),
        home: BottomNavigationScreen(),
      ),
    );
  }
}
