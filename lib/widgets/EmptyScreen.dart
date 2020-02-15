import 'package:flutter/material.dart';
import '../mainScreens/bottomNavigationScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/globalButton.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final String subTitle;

  EmptyScreen({
    this.title,
    this.subTitle,
  });

  void _continueShopping(BuildContext context) {
    Navigator.pushReplacement(
      context,
      FadeRoute(
        page: BottomNavigationScreen(),
      ),
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
              fontSize: 12.0,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        GlobalButton(
          buttonTitle: 'Continue shopping',
          onTab: () => _continueShopping(context),
        )
      ],
    );
  }
}
