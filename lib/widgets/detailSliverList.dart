import 'package:flutter/material.dart';
import '../widgets/features.dart';
import '../widgets/reviewsList.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class DetailSliverList extends StatefulWidget {
  @override
  _DetailSliverListState createState() => _DetailSliverListState();
}

class _DetailSliverListState extends State<DetailSliverList> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('500',style:  TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),),

                        Icon(Icons.attach_money,size: 20.0,),
                        Text('1200',style:  TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 16.0,
                            decoration: TextDecoration.lineThrough,
                          ),),

                        Icon(Icons.attach_money,size: 20.0,),
                      ],
                    ),
                    Container(
                      height: 20.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        color: Color(0xffFFDEDC),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Text('-15 %',style: TextStyle(color: Color(0xffE62E04)),)),
                    )
                  ],
                ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Text('All prices include VAT',style: TextStyle(
                color: Color(0xff007AFF),
                fontFamily: 'Roboto',
              ),),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SmoothStarRating(
                      allowHalfRating: true,
                      onRatingChanged: (v) {
                        rating = v;
                        setState(() {
                          //ToDo
                        });
                      },
                      starCount: 5,
                      rating: rating,
                      size: 25.0,
                      color: Color(0xffEA9307),
                      borderColor: Color(0xffEA9307),
                      spacing:0.0
                  ),
                ),
                Text('4.5'),
              ],
            ),

            SizedBox(height: 10.0,),
            //Divider
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10.0,
              color: Color(0xffF0F4F9),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Features',style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),),
            ),
            Features(
              feature: 'fast shipping',
              containerColor: Color(0xffEA9307),
            ),
            Features(
              feature: 'Easy Returns',
              containerColor: Color(0xff59B95F),
            ),
            //Divider
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10.0,
              color: Color(0xffF0F4F9),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Description',style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'We have eliminated distractions for a cinematic viewing experience. By utilizing precise laser cutting, the camera has been discreetly tucked away within the display without sacrificing photo quality.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 12.0,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right:8.0,left: 8.0),
              child: Container(
                height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Image.asset('assets/images/iphoneTest.png')
              ),
            ),
            // // مكان btn بتاع view more


            Container(
              width: MediaQuery.of(context).size.width,
              height: 10.0,
              color: Color(0xffF0F4F9),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text('Reviews',style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('(190)'),
                ],
              ),
            ),

          ])
      );

  }
}