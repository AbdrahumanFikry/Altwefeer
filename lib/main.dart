import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity/authScreens/loginScreen.dart';
import 'package:infinity/widgets/loader.dart';
import 'package:provider/provider.dart';
import './Providers/cartProvider.dart';
import './Providers/wishListProvider.dart';
import './mainScreens/splashScreen.dart';
import './authScreens/SignUpScreen.dart';
import './Providers/Auth.dart';
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
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'infinity',
          theme: ThemeData(
            primaryColor: Colors.grey,
          ),
          home: auth.isAuth
              ? SplashScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, snapShot) =>
                      snapShot.connectionState == ConnectionState.waiting
                          ? Container()
                          : LogInScreen(),
                ),
        ),
      ),
    );
  }
}
