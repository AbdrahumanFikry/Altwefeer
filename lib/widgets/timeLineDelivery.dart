import 'package:flutter/material.dart';

class TimeLineDelivery extends StatelessWidget {
  final String title;
  TimeLineDelivery({this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              decoration: new BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Text(""),
            ),
            RotatedBox(
              quarterTurns: 1,
              child: Container(
                width: 3,
                height: MediaQuery.of(context).size.height*0.2,
                decoration: new BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ),
          ],
        ),
        Text(title),
      ],
    );
  }
}

class TimeLineLastLine extends StatelessWidget {
  final String title;
  TimeLineLastLine({this.title});
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
        width: 18,
        height: 18,
        decoration: new BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Text(""),
      ),
          Text(title)
        ],
      );

  }
}
