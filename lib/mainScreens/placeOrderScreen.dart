import 'package:flutter/material.dart';
import 'package:infinity/widgets/globalButton.dart';
import '../widgets/placeOrderInfo.dart';

class PlaceOrderScreen extends StatelessWidget {
  void _placeOrder(BuildContext context) {
    //TODO --------
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
            height: 10.0,
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
