import 'package:flutter/material.dart';
import '../mainScreens/paymentScreen.dart';
import '../mainScreens/placeOrderScreen.dart';
import '../widgets/globalButton.dart';
import '../widgets/pageRoute.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  //----------------------------- variables ------------------------------------
  int groupValue = 0;

  //------------------------------ methods -------------------------------------

  void onChanged(int value) {
    setState(() {
      groupValue = value;
      print(groupValue.toString());
    });
  }

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
        page: PaymentScreen(),
      ),
    );
  }

  void _continue() {
    switch (groupValue) {
      case 0:
        _cashOnDelivery();
        break;
      case 1:
        _paymentMethod();
        break;
      default:
        print('Invaild choice!');
        break;
    }
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
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(
                  5.0,
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: groupValue,
                      onChanged: onChanged,
                    ),
                    Text(
                      'Cash On Delivery',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1.0,
              ),
              Container(
                padding: EdgeInsets.all(
                  5.0,
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: groupValue,
                      onChanged: onChanged,
                    ),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2.5,
                    ),
                  ),
                  Container(
                    height: 7.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2.5,
                    ),
                  ),
                  Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2.5,
                    ),
                  ),
                ],
              ),
              GlobalButton(
                buttonTitle: 'Continue',
                onTab: _continue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
