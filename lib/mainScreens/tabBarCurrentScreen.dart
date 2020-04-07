import 'package:flutter/material.dart';
import 'package:infinity/widgets/pageRoute.dart';
import '../mainScreens/orderDetailsScreen.dart';
class TabBarCurrentScreen extends StatelessWidget {
  void _goToOrderDetails(BuildContext context) {
    Navigator.push(
      context,
      ScaleRoute(
        page: OrderDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool inProcessing = true, ready = true, onTheWay = false;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 7.0,
        ),
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
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  '25/10/2020',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 18,
                height: 18,
                decoration: new BoxDecoration(
                  color: inProcessing ? Colors.green : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  width: 3,
                  height: (MediaQuery.of(context).size.width / 2) - 36,
                  decoration: new BoxDecoration(
                    color: ready ? Colors.green : Colors.grey,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Container(
                width: 18,
                height: 18,
                decoration: new BoxDecoration(
                  color: ready ? Colors.green : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  width: 3,
                  height: (MediaQuery.of(context).size.width / 2) - 36,
                  decoration: new BoxDecoration(
                    color: onTheWay ? Colors.green : Colors.grey,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Container(
                width: 18,
                height: 18,
                decoration: new BoxDecoration(
                  color: onTheWay ? Colors.green : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'In processing',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: inProcessing ? Colors.black : Colors.black),
              ),
              Spacer(),
              Text(
                'Ready',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: ready ? Colors.black : Colors.black,
                ),
              ),
              Spacer(),
              Text(
                'On the way',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: onTheWay ? Colors.black : Colors.black,
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Grand Total : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      '450 ' + ' EGP',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.2,),
                Row(
                  children: <Widget>[
                    Text(
                      'Order Number : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      '5697',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _goToOrderDetails(context),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Order Details ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
