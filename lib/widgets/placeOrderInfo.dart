import 'package:flutter/material.dart';

class PlaceOrderInfo extends StatelessWidget {
  final String title;
  final String prise;
  PlaceOrderInfo({this.prise,this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),),
          Text(prise + ' EGP',style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),)
        ],
      ),
    );
  }
}
