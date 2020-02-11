import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:infinity/mainScreens/ImageViewer.dart';

class DetailSlider extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
    'assets/images/iphoneTest.png',
  ];

  void _showImage(BuildContext context, String image, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return ImageViewer(
            image: image,
            id: id,
            images: imgList,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    double deviceWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      height: 150.0,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
        (imageTest) {
          index++;
          return Hero(
            tag: index.toString(),
            child: GestureDetector(
              onTap: () => _showImage(context, imageTest, index),
              child: Container(
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
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
