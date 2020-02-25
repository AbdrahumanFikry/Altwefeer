import 'package:flutter/material.dart';
import '../authScreens/loginScreen.dart';
import '../mainScreens/bottomNavigationScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/globalButton.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool needSign;

  EmptyScreen({
    this.title,
    this.subTitle,
    this.needSign = false,
  });

  void _continueShopping(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      FadeRoute(
        page: BottomNavigationScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  void _signIn(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      FadeRoute(
        page: LogInScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 14.0,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        needSign
            ? GlobalButton(
                buttonTitle: 'Sign in',
                onTab: () => _signIn(context),
              )
            : GlobalButton(
                buttonTitle: 'Continue shopping',
                onTab: () => _continueShopping(context),
              )
      ],
    );
  }
}
