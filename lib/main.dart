import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/paymentScreen.dart';
import 'package:infinity/mainScreens/searchScreen.dart';
import 'package:infinity/mainScreens/tabBarScreen.dart';
import './mainScreens/FilterScreen.dart';
import './mainScreens/CategoryElementsScreen.dart';
import 'package:provider/provider.dart';
import './Providers/cartProvider.dart';
import './Providers/wishListProvider.dart';
import './mainScreens/profileScreen.dart';
import './mainScreens/settingScreen.dart';
import './mainScreens/bottomNavigationScreen.dart';
import './mainScreens/accountInfo.dart';
import 'package:flutter/services.dart';
import './mainScreens/wishListScreen.dart';
import './mainScreens/categoriesScreen.dart';
import './authScreens/forgotPasswordScreen.dart';
import './mainScreens/paymentFormScreen.dart';
import './authScreens/checkEmailScreen.dart';
import './authScreens/loginScreen.dart';
import './mainScreens/homeScreen.dart';
import './mainScreens/orderPlacedSuccessfullyScreen.dart';
import './mainScreens/placeOrderScreen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishList(),
        ),
      ],
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
