import 'package:flutter/material.dart';
import 'package:infinity/Providers/productsProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/itemViewer.dart';
import '../widgets/slider.dart';

class Section extends StatelessWidget {
  final String title;
  final int sectionIndex;
  final List data;
  final List ads;

  Section({
    @required this.title,
    this.sectionIndex,
    this.data,
    this.ads,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        sectionIndex == 0
            ? AdsSlider(ads: ads)
            : SizedBox(
                height: 0.5,
              ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
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
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ItemViewer(
                      id: data[index].id,
                      title: data[index].name,
                      price: data[index].price.toString(),
                      images: data[index].images,
                      offer: '0',
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
