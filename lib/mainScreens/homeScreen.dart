import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:infinity/widgets/loader.dart';
import '../widgets/section.dart';
import '../widgets/pageRoute.dart';
import '../mainScreens/cartScreen.dart';
import 'package:provider/provider.dart';
import '../Providers/cartProvider.dart';
import '../mainScreens/searchScreen.dart';
import '../Providers/productsProvider.dart';

class HomeScreen extends StatelessWidget {
  //-----------------------------variables----------------------------------
//  final SearchScreen _searchItems = SearchScreen(
//    [
//      'aaaaa',
//      'bbbbbbbbbbbb',
//      'ccccccccccccc',
//    ],
//  );

  //-----------------------------methods------------------------------------

  void _goToCart(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: CartScreen(),
      ),
    );
  }

  void _goToSearch(BuildContext context) async {
    final SearchScreen _searchItems = SearchScreen(
        Provider.of<ProductsProvider>(context, listen: false).searchItems);
    await showSearch<String>(
      context: context,
      delegate: _searchItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: GestureDetector(
          onTap: () => _goToSearch(context),
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
                color: Colors.grey[500],
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
                    color: Colors.grey[500],
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
                  ? Image.asset('assets/icons/cart.png')
                  : Badge(
                      animationType: BadgeAnimationType.scale,
                      badgeColor: Colors.red,
                      shape: BadgeShape.circle,
                      animationDuration: Duration(microseconds: 200),
                      toAnimate: true,
                      elevation: 5.0,
                      position: BadgePosition.topRight(
                        right: 3.0,
                        top: 0.0,
                      ),
                      badgeContent: Text(
                        cartItems.cartList.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      child:
                          Tab(icon: new Image.asset('assets/icons/cart.png')),
                    ),
              onPressed: () => _goToCart(context),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<ProductsProvider>(context, listen: false).products ==
                    null
                ? Provider.of<ProductsProvider>(context, listen: false)
                    .fetchProducts()
                : null,
        builder: (context, dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: ColorLoader(),
            );
          } else {
            if (dataSnapShot.error != null) {
              return Center(
                child: Text(
                  'Check internet connection!',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              );
            } else {
              return Consumer<ProductsProvider>(
                builder: (context, products, child) => Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: products.products.sections.length,
                    itemBuilder: (context, index) {
                      return Section(
                        title: products.products.sections[index].title,
                        sectionIndex: index,
                        data: products.products.sections[index].src,
                        ads: products.products.ads,
                      );
                    },
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
