import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity/mainScreens/bottomNavigationScreen.dart';
import 'package:infinity/mainScreens/splashScreen.dart';
import 'package:provider/provider.dart';
import './Providers/cartProvider.dart';
import './Providers/wishListProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitUp,
      ],
    );
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
        home: SplashScreen(),
      ),
    );
  }
}
