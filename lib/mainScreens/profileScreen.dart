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

  Future<void> _signOut(BuildContext context) {
    //TODO ----------
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'My account',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
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
          Container(
            height: 10.0,
            width: double.infinity,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: Text(
              'More',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
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
          Container(
            height: 10.0,
            width: double.infinity,
            color: Colors.grey[200],
          ),
          SizedBox(
            height: 10.0,
          ),
          ProfileItems(
            icon: Icons.exit_to_app,
            title: 'Sign out',
            onTap: () => _signOut(context),
          ),
        ],
      ),
    );
  }
}
