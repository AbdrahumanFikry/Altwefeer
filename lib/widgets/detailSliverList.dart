import 'package:flutter/material.dart';
import '../widgets/detailSlider.dart';
import '../widgets/features.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailSliverList extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final String price;
  final String offer;
  final String reviews;

  DetailSliverList({
    this.title,
    this.image,
    this.description,
    this.price,
    this.offer,
    this.reviews,
  });

  @override
  _DetailSliverListState createState() => _DetailSliverListState();
}

class _DetailSliverListState extends State<DetailSliverList> {
  var rating = 4.5;

  @override
  Widget build(BuildContext context) {
    double offerNum = double.parse(widget.offer);
    double percent =
        100 - ((double.parse(widget.offer) / double.parse(widget.price)) * 100);
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                offerNum == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.price,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                            size: 16.0,
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.offer,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                            size: 16.0,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            widget.price,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: 14.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(
                            Icons.attach_money,
                            color: Colors.grey,
                            size: 14.0,
                          ),
                        ],
                      ),
                offerNum > 0
                    ? Container(
                        height: 20.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              7.0,
                            ),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              '-' + percent.toString().split('.')[0] + '%',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    : new Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            child: Text(
              'All prices include VAT',
              style: TextStyle(
                color: Color(0xff007AFF),
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: rating,
                  size: 23.0,
                  color: Colors.yellow,
                  borderColor: Colors.grey,
                  spacing: 0.0,
                ),
              ),
              Text(
                rating.toString(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          //Divider
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Color(0xffF0F4F9),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Features',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            //TODO -------- Length ------
            height: 3 * 42.0,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Features(
                  feature: 'fast shipping',
                  containerColor: Color(0xffEA9307),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Color(0xffF0F4F9),
          ),
          Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Text(
              'Description',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.description,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: DetailSlider(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Color(0xffF0F4F9),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Reviews',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.reviews == null ? '0' : widget.reviews,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70.0,
          ),
        ],
      ),
    );
  }
}
