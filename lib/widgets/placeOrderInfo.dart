import 'package:flutter/material.dart';

class PlaceOrderInfo extends StatelessWidget {
  final String title;
  final String price;

  PlaceOrderInfo({
    this.price,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            price + ' EGP',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
