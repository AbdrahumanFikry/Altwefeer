import 'package:flutter/material.dart';

class FinishedOrderItem extends StatelessWidget {
  final String date;
  final String price;

  FinishedOrderItem({
    this.date,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            top: 10.0,
            right: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Delivered at : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            5.0,
          ),
          child: Row(
            children: <Widget>[
              Text(
                'SubTotal : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                price + ' EGP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
