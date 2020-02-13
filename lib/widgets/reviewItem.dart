import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewItem extends StatelessWidget {
  final String user;
  final String date;
  final double rate;
  final String review;

  ReviewItem({
    this.user,
    this.rate,
    this.date,
    this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            user,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(
                  2.5,
                ),
                child: SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: rate,
                  size: 16.0,
                  color: Colors.yellow,
                  borderColor: Colors.grey,
                  spacing: 0.0,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            review,
            style: TextStyle(
              fontFamily: 'Roboto',
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
          Divider(
            height: 5.0,
            color: Colors.grey,
            indent: 90.0,
          ),
        ],
      ),
    );
  }
}
