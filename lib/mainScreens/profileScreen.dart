import 'package:flutter/material.dart';
import '../widgets/profileItems.dart';
class ProfileScreen extends StatelessWidget {
  @override
  //-------------------------------function------------------------------
  void _goToOrders(){
    //ToDo--------
  }
  void _goToWishList(){
    //ToDo--------
  }
  void _goToAddressBook(){
    //ToDo--------
  }
  void _goToPayment(){
    //ToDo--------
  }
  void _goToSupport(){
    //ToDo--------
  }
  void _goToSettings(){
    //ToDo--------
  }
  //-------------------------------build-----------------------------------
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Add Address',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body:  ListView(
        children: <Widget>[
          SizedBox(height: 20.0,),
          ProfileItems(
            icon: Icons.history,
            title: 'Orders',
            onTap: _goToOrders,
          ),
          ProfileItems(
            icon: Icons.favorite_border,
            title: 'Wishlist',
            onTap: _goToWishList,
          ),
          ProfileItems(
            icon: Icons.library_books,
            title: 'Address Book',
            onTap: _goToAddressBook,
          ),
          ProfileItems(
            icon: Icons.credit_card,
            title: 'Payment',
            onTap: _goToPayment,
          ),
          ProfileItems(
            icon: Icons.headset,
            title: 'Support',
            onTap: _goToSupport,
          ),
          ProfileItems(
            icon: Icons.settings,
            title: 'Settings',
            onTap: _goToSettings,
          ),
        ],
      ),
    );

  }
}
