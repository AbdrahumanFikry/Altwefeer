import 'package:flutter/material.dart';
import '../widgets/timeLineDelivery.dart';
class TabBarCurrentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Expected Date : ',
                  style: TextStyle(color: Colors.grey, fontFamily: 'Roboto'),
                ),
                Text(
                  '25/10/2020',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               TimeLineDelivery(
                 title: 'inprocessing',
               ),
               TimeLineDelivery(
                 title: 'Ready',
               ),
               TimeLineLastLine(
                 title: 'On the way',
               )
             ],
           ),
         ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Grand Total : ',style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                    ),),
                    Text('450 ' + 'EGP',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                    ),),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Order Number : ',style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                    ),),
                    Text('5697',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                    ),),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                //todo-------
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Order Details : ',style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                    ),),
                    Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
