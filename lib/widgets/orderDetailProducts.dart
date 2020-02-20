import 'package:flutter/material.dart';

class OrderDetailProducts extends StatelessWidget {
  final String image;
  final String title;
  final String qty;
  final String prise;
  OrderDetailProducts({this.image, this.title, this.prise, this.qty});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(height: 100, width: 100, child: Image.asset(image)),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(prise,style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),),
                              Icon(Icons.attach_money,color: Colors.black,size: 18.0,),
                            ],
                          ),
                          Text('Qty : ' + qty,style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),),
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          );
        });
  }
}
