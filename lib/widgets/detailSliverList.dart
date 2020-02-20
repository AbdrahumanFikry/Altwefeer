import 'package:flutter/material.dart';
import 'package:infinity/widgets/reviewItem.dart';
import '../widgets/detailSlider.dart';
import '../widgets/features.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../widgets/section.dart';

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
  bool _isMore = false;

  void _viewMoreOrLess() {
    setState(() {
      _isMore = !_isMore;
    });
  }

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
                          color: Color(0xffFFE1E0),
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
              'Samsung Galaxy Note10 - 6.3-inch 256GB/8GB Dual SIM 4G Mobile Phone - Aura Black',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
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
                  color: Color(0xffEA9307),
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
          //-------------------------- Features --------------------------------
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
                  key: ValueKey(index),
                  feature: 'fast shipping',
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Color(0xffF0F4F9),
          ),
          //------------------------ Description -------------------------------
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
          //------------------------ Images Slider -----------------------------
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Image.asset('assets/images/iphoneTest.png'),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Color(0xffF0F4F9),
          ),
          //--------------------------- Reviews --------------------------------

          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Reviews ',
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
                GestureDetector(
                  onTap: _viewMoreOrLess,
                  child: Container(
                    height: _isMore
                        ? MediaQuery.of(context).size.height * 0.4
                        : 220.0,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: _isMore ? 5 : 2,
                            physics: _isMore
                                ? ScrollPhysics()
                                : NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ReviewItem(
                                user: 'Mohamed Mostafa',
                                rate: 4.5,
                                date: '4 months',
                                review: 'Not too bad ',
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 7.0,
                            horizontal: 25.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                30.0,
                              ),
                            ),
                          ),
                          child: Text(
                            _isMore ? 'View less' : 'View more',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Color(0xffF0F4F9),
          ),
          //------------------------ Recommended -------------------------------
          Section(
            title: 'Recommended',
          ),
          SizedBox(
            height: 70.0,
          ),
        ],
      ),
    );
  }
}
