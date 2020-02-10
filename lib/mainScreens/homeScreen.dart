import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '../widgets/section.dart';

class HomeScreen extends StatelessWidget {
  //-----------------------------variables----------------------------------

  //-----------------------------methods------------------------------------

  void _goToCart() {
    //TODO -------
  }

  void _goToSearch() {
    //TODO -------
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: GestureDetector(
          onTap: _goToSearch,
          child: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25.0,
                ),
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
          IconButton(
            icon: Badge(
              animationType: BadgeAnimationType.slide,
              badgeColor: Colors.red,
              shape: BadgeShape.circle,
              animationDuration: Duration(microseconds: 200),
              toAnimate: true,
              elevation: 5.0,
              position: BadgePosition.topRight(
                right: 5.0,
              ),
              badgeContent: Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: 'Roboto',
                ),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
                size: 30.0,
              ),
            ),
            onPressed: _goToCart,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 150,
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
