import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailSlider extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      height: 150.0,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
        (imageTest) {
          return Container(
            width: deviceWidth > 400
                ? 400
                : MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5.0,
                ),
              ),
              child: Image.asset(
                imageTest,
                fit: BoxFit.fill,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
