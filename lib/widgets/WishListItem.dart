import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cartItemModel.dart';
import '../Providers/cartProvider.dart';
import '../Providers/wishListProvider.dart';

class WishListItem extends StatelessWidget {
  final CartItemModel item;

  WishListItem({
    this.item,
  });

  void _removeFromWishList(BuildContext context, int index) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure ?',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(
          'Do you want to remove this item from WishList?',
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
                  .removeItem(index);
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

  void _addToCart(BuildContext context, CartItemModel item, int index) async {
    await Provider.of<Cart>(context, listen: false).addItemToCart(item);
    await Provider.of<WishList>(context, listen: false).removeItem(index);
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Row(
          children: <Widget>[
            Text(
              'Added to Cart',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<WishList>(context);
    int index = wishList.wishList.indexWhere((i) => i.id == item.id);
    return Container(
      height: 115.0,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 10.0,
        right: 0.0,
        top: 2.0,
        bottom: 2.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 7.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80.0,
            width: 90.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[100],
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5.0,
                ),
              ),
              image: DecorationImage(
                image: AssetImage(
                  item.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Item Price: ',
                                style: TextStyle(
                                  color: Colors.teal[400],
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              Text(
                                item.price.toString() + ' EGP',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _removeFromWishList(context, index),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            5.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 18.0,
                            child:Image.asset('assets/icons/delete.png'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _addToCart(context, item, index),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            5.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 18.0,
                            child:Image.asset('assets/icons/cart.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
