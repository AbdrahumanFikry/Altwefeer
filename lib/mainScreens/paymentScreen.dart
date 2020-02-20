import 'package:flutter/material.dart';
import '../mainScreens/placeOrderScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/paymentData.dart';
import '../mainScreens/paymentFormScreen.dart';

class PaymentScreen extends StatelessWidget {
  final bool showOnly;

  PaymentScreen({
    this.showOnly = false,
  });

  void _addPaymentMethod(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: PaymentFormScreen(),
      ),
    );
  }

  void _showDetails(BuildContext context) {
    //TODO -------------
  }

  void _continuePayment(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: PlaceOrderScreen(),
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
      body: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PaymentData(
                numberOfCard: '5423168547952333',
                onTap: () {
                  showOnly ? _showDetails(context) : _continuePayment(context);
                },
              );
            },
          ),
          GestureDetector(
            onTap: () => _addPaymentMethod(context),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: Center(
                child: Text(
                  '+ Add payment method',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
