import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/orderPlacedSuccessfullyScreen.dart';
import 'package:infinity/widgets/globalButton.dart';
import 'package:infinity/widgets/pageRoute.dart';
import '../widgets/placeOrderInfo.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  void _placeOrder(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(
        page: OrderPlacedSuccessfullyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Place Order',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          PlaceOrderInfo(
            title: 'Subtotal',
            price: '435',
          ),
          PlaceOrderInfo(
            title: 'Delivery fees',
            price: '15',
          ),
          Divider(),
          PlaceOrderInfo(
            title: 'Grand total',
            price: '450',
          ),
          Spacer(),
          GlobalButton(
            buttonTitle: 'Place order',
            onTab: () => _placeOrder(context),
          )
        ],
      ),
    );
  }
}
