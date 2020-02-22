import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/WishListItem.dart';
import 'package:provider/provider.dart';
import '../Providers/wishListProvider.dart';
import '../widgets/EmptyScreen.dart';

class WishListScreen extends StatelessWidget {
  void _emptyWishList(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure ?',
          style: TextStyle(
            color: Colors.blue,
            fontFamily: 'Roboto',
          ),
        ),
        content: Text(
          'Do you want to empty WishList?',
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              'No',
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
          ),
          FlatButton(
            onPressed: () async {
              await Provider.of<WishList>(context, listen: false)
                  .emptyWishList();
              Navigator.of(context).pop(true);
            },
            child: Text(
              'Yes',
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<WishList>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Text(
          'WishList',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
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
            wishList.clearCache();
          },
        ),
        actions: <Widget>[
          wishList.wishList.length == 0
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17.0,
                    horizontal: 5.0,
                  ),
                  child: InkWell(
                    splashColor: Colors.redAccent,
                    onTap: () => _emptyWishList(context),
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
        ],
      ),
      body: wishList.wishList.length == 0
          ? EmptyScreen(
              title: 'Empty WishList',
              subTitle: 'Add items to wishList and watched later',
            )
          : Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: wishList.wishList.length,
                    itemBuilder: (context, index) {
                      return WishListItem(
                        item: wishList.wishList[index],
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    wishList.deletedItems.isEmpty
                        ? Container()
                        : Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 20.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.teal[800],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 2.0,
                                  offset: Offset(
                                    2.0,
                                    2.0,
                                  ),
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  7.0,
                                ),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '${wishList.deletedItems.length} items removed from Cart',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    wishList.undoAll();
                                  },
                                  child: Text(
                                    'Undo',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ],
            ),
    );
  }
}
