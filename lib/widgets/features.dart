import 'dart:math';

import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  final String feature;

  Features({
    Key key,
    this.feature,
  });

  @override
  Widget build(BuildContext context) {
    const colors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.deepPurple,
      Colors.white,
      Colors.pink,
    ];
    Color iconColor = colors[Random().nextInt(6)];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 3.0,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
              color: Colors.grey[300],
            ),
            child: Center(
              child: Icon(
                Icons.scatter_plot,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            feature,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
