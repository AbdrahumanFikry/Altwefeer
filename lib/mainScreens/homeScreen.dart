import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '../widgets/section.dart';
import '../widgets/pageRoute.dart';
import '../mainScreens/cartScreen.dart';
import 'package:provider/provider.dart';
import '../Providers/cartProvider.dart';

class HomeScreen extends StatelessWidget {
  //-----------------------------variables----------------------------------

  //-----------------------------methods------------------------------------

  void _goToCart(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: CartScreen(),
      ),
    );
  }

  void _goToSearch() {
    //TODO -------
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Cart>(context, listen: false).fetchData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: GestureDetector(
          onTap: _goToSearch,
          child: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25.0,
                ),
              ),
              border: Border.all(
                color: Color(0xffF0F4F9),
                width: 1.0,
              ),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                    color: Color(0xffF0F4F9),
                  ),
                ),
                Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (context, cartItems, child) => IconButton(
              icon: cartItems.cartList.length == 0
                  ? Icon(
                      Icons.shopping_cart,
                      color: Colors.grey,
                      size: 30.0,
                    )
                  : Badge(
                      animationType: BadgeAnimationType.scale,
                      badgeColor: Colors.red,
                      shape: BadgeShape.circle,
                      animationDuration: Duration(microseconds: 200),
                      toAnimate: true,
                      elevation: 5.0,
                      position: BadgePosition.topRight(
                        right: 5.0,
                      ),
                      badgeContent: Text(
                        cartItems.cartList.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                        size: 30.0,
                      ),
                    ),
              onPressed: () => _goToCart(context),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Section(
              title: 'Recommended',
              index: index,
            );
          },
        ),
      ),
    );
  }
}
