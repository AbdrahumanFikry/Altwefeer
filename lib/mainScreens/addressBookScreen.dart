import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/paymentMethodScreen.dart';
import 'package:infinity/widgets/globalButton.dart';
import 'package:infinity/widgets/pageRoute.dart';
import '../widgets/addressBookItem.dart';

class AddressBookScreen extends StatelessWidget {
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
                whereToGo: (){
                  Navigator.push(
                    context,
                    FadeRoute(
                      page: PaymentMethodScreen(),
                    ),
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: GlobalButton(
                  buttonTitle: 'Add Address',
                  onTab: (){
                    //ToDo----------
                  }
              ),
            ),
          )
        ],
      )
    );
  }
}
