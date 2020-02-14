import 'package:flutter/material.dart';
import '../widgets/globalButton.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Empty cart',
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
            'Continue shopping and add to cart',
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
          onTab: () {},
        )
      ],
    );
  }
}
