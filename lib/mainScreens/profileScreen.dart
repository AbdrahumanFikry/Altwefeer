import 'package:flutter/material.dart';
import '../mainScreens/addressBookScreen.dart';
import '../mainScreens/settingScreen.dart';
import '../mainScreens/supportScreen.dart';
import 'package:provider/provider.dart';
import '../mainScreens/wishListScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/profileItems.dart';
import '../Providers/wishListProvider.dart';
import '../mainScreens/paymentScreen.dart';
import '../mainScreens/tabBarScreen.dart';

class ProfileScreen extends StatelessWidget {
  void _goToOrders(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: TabBarScreen(),
      ),
    );
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
        page: AddressBookScreen(
          showOnly: true,
        ),
      ),
    );
  }

  void _goToPayment(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: PaymentScreen(
          showOnly: true,
        ),
      ),
    );
  }

  void _goToSupport(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: SupportScreen(),
      ),
    );
  }

  void _goToSettings(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: SettingScreen(),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    //TODO ----------
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
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
            image: Image.asset('assets/icons/orders.png'),
            title: 'Orders',
            onTap: () => _goToOrders(context),
          ),
          ProfileItems(
            image: Image.asset('assets/icons/heart.png'),
            title: 'Wishlist',
            onTap: () => _goToWishList(context),
            notifications:
                Provider.of<WishList>(context).wishList.length.toString(),
          ),
          ProfileItems(
            image: Image.asset('assets/icons/addressBook.png'),
            title: 'Address Book',
            onTap: () => _goToAddressBook(context),
          ),
          ProfileItems(
            image: Image.asset('assets/icons/payment.png'),
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
            image: Image.asset('assets/icons/support.png'),
            title: 'Support',
            onTap: () => _goToSupport(context),
          ),
          ProfileItems(
            image: Image.asset('assets/icons/setting.png'),
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
            image: Image.asset('assets/icons/signOut.png'),
            title: 'Sign out',
            onTap: () => _signOut(context),
          ),
        ],
      ),
    );
  }
}
