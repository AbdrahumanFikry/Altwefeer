import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdsSlider extends StatelessWidget {
  final List ads;

  AdsSlider({this.ads});

//  final List<String> imgList = [
//    'assets/images/test.png',
//    'assets/images/test.png',
//    'assets/images/test.png',
//    'assets/images/test.png',
//    'assets/images/test.png',
//  ];

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [];
    ads.forEach(
      (ad) {
        imgList.add(ad.path);
      },
    );
    double deviceWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      height: 180.0,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
        (imageTest) {
          return Container(
            width: deviceWidth > 512
                ? 512
                : MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5.0,
                ),
              ),
              child: Image.network(
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
