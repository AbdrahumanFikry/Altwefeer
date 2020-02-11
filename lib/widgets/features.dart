import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  final Color containerColor;
  final String feature;

  Features({this.containerColor,this.feature});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: containerColor,
            ),
            child: Center(
              child: Icon(Icons.print),
            ),
          ),
          SizedBox(width: 2.0,),
          Text(feature,style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),)
        ],
      ),
    );
  }
}
