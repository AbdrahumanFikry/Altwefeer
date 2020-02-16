import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/addressBookScreen.dart';
import 'package:infinity/mainScreens/settingScreen.dart';
import 'package:provider/provider.dart';
import '../mainScreens/wishListScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/profileItems.dart';
import '../Providers/wishListProvider.dart';

class ProfileScreen extends StatelessWidget {
  void _goToOrders(BuildContext context) {
    //ToDo--------
  }

  void _goToWishList(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: WishListScreen(),
      ),
    );
  }

  void _goToAddressBook(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: AddressBookScreen(),
      ),
    );
  }

  void _goToPayment(BuildContext context) {
    //ToDo--------
  }

  void _goToSupport(BuildContext context) {
    //ToDo--------
  }

  void _goToSettings(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: SettingScreen(),
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
          'Profile',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          ProfileItems(
            icon: Icons.history,
            title: 'Orders',
            onTap: () => _goToOrders(context),
          ),
          ProfileItems(
            icon: Icons.favorite_border,
            title: 'Wishlist',
            onTap: () => _goToWishList(context),
            notifications:
                Provider.of<WishList>(context).wishList.length.toString(),
          ),
          ProfileItems(
            icon: Icons.library_books,
            title: 'Address Book',
            onTap: () => _goToAddressBook(context),
          ),
          ProfileItems(
            icon: Icons.credit_card,
            title: 'Payment',
            onTap: () => _goToPayment(context),
          ),
          ProfileItems(
            icon: Icons.headset,
            title: 'Support',
            onTap: () => _goToSupport(context),
          ),
          ProfileItems(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () => _goToSettings(context),
          ),
        ],
      ),
    );
  }
}
