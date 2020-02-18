import 'package:flutter/material.dart';
class TabBarFinishedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
            return Column(
              children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Row(
                   children: <Widget>[
                     Text(
                       'Delivered at : ',
                       style: TextStyle(
                         color: Colors.grey,
                         fontSize: 14.0,
                         fontFamily: 'Roboto',
                       ),
                     ),
                     Text(
                       '25/10/2020',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Roboto',
                       ),
                     ),
                   ],
                 ),
               ) ,
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'SubTotal : ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        '450' + 'EGP',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider()
              ],
            );
          }
      ),
    );
  }
}
