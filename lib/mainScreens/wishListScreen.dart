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
          onPressed: () => Navigator.of(context).pop(),
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
          : Container(
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
    );
  }
}
