import 'package:flutter/material.dart';
import 'package:infinity/widgets/pageRoute.dart';
import '../widgets/paymentData.dart';
import '../mainScreens/paymentFormScreen.dart';
class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Payment',
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
      body: ListView(
        children: <Widget>[
          PaymentData(
            numberOfCard: '5455*******',
          ),
          PaymentData(
            numberOfCard: '5455*******',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  ScaleRoute(
                    page: PaymentFormScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xffF0F4F9),
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Center(
                  child: Text('+ Add payment method',style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold
                  ),),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
