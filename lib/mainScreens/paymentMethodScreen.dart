import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/paymentFormScreen.dart';
import 'package:infinity/mainScreens/placeOrderScreen.dart';
import 'package:infinity/widgets/pageRoute.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  void _cashOnDelivery() {
    Navigator.push(
      context,
      FadeRoute(
        page: PlaceOrderScreen(),
      ),
    );
  }

  void _paymentMethod() {
    Navigator.push(
      context,
      FadeRoute(
        page: PaymentFormScreen(),
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
          'Payment Method',
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
          GestureDetector(
            onTap: _cashOnDelivery,
            child: Container(
              padding: EdgeInsets.all(
                5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Cash On Delivery',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Roboto'),
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
          Divider(),
          GestureDetector(
            onTap: _paymentMethod,
            child: Container(
              padding: EdgeInsets.all(
                5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      ),
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
        ],
      ),
    );
  }
}
