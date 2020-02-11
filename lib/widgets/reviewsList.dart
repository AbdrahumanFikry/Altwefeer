import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rating = 0.0;
    return Column(
      children: <Widget>[
        Text('Mohammed Essam'),
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SmoothStarRating(
                      allowHalfRating: true,
                      onRatingChanged: (v) {
                        rating = v;
                      },
                      starCount: 5,
                      rating: rating,
                      size: 25.0,
                      color: Color(0xffEA9307),
                      borderColor: Color(0xffEA9307),
                      spacing: 0.0),
                ),
                Text('2 month'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
