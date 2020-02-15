import 'package:flutter/material.dart';
import '../mainScreens/addAddressScreen.dart';
import '../mainScreens/paymentMethodScreen.dart';
import '../widgets/globalButton.dart';
import '../widgets/pageRoute.dart';
import '../widgets/addressBookItem.dart';

class AddressBookScreen extends StatelessWidget {
  void _goToAddress(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(
        page: PaymentMethodScreen(),
      ),
    );
  }

  void _addAddress(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(
        page: AddAddressScreen(),
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
          'Address book',
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
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return AddressBookItem(
                whereToGo: () => _goToAddress(context),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GlobalButton(
                buttonTitle: 'Add Address',
                onTab: () => _addAddress(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
