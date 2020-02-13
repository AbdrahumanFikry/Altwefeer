import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 30.0,
          width: 30.0,
          margin: EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.teal[800],
              width: 2.0,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                5.0,
              ),
              bottomLeft: Radius.circular(
                5.0,
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              if (amount > 1) {
                setState(() {
                  amount--;
                });
              }
            },
            child: Icon(
              Icons.remove,
              color: Colors.teal[800],
            ),
          ),
        ),
        Container(
          height: 30.0,
          width: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.teal[800],
              width: 2.0,
            ),
          ),
          margin: EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                amount.toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 30.0,
          width: 30.0,
          margin: EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.teal[800],
              width: 2.0,
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                5.0,
              ),
              bottomRight: Radius.circular(
                5.0,
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                amount++;
              });
            },
            child: Icon(
              Icons.add,
              color: Colors.teal[800],
            ),
          ),
        ),
      ],
    );
  }
}
