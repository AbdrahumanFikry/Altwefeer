import 'package:flutter/material.dart';
import '../widgets/itemViewer.dart';
import '../widgets/slider.dart';

class Section extends StatelessWidget {
  final String title;
  final int index;

  Section({@required this.title, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        index == 0
            ? AdsSlider()
            : SizedBox(
                height: 0.5,
              ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 225,
          margin: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          padding: EdgeInsets.only(
            right: 0.0,
            top: 10.0,
            bottom: 10.0,
            left: 7.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ItemViewer(
                      title: 'Apple Iphone X With Facetime - 64 GB, 4G LTE, Space Grey ',
                      price: '5000',
                      image:'assets/images/iphoneTest.png',
                      offer: '4200',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
