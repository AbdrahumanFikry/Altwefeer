import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/wishListProvider.dart';
import '../models/cartItemModel.dart';
import '../Providers/cartProvider.dart';

class SubElement extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final String price;
  final String offer;

  SubElement({
    this.id,
    this.title,
    this.image,
    this.price,
    this.offer,
  });

  @override
  _SubElementState createState() => _SubElementState();
}

class _SubElementState extends State<SubElement> {
  //------------------------------variables------------------------------------
  bool _isFavourite = false;

  //------------------------------methods--------------------------------------

  void _switchFavorite(int index) async {
    setState(() {
      _isFavourite = !_isFavourite;
    });
    if (_isFavourite) {
      await Provider.of<WishList>(context, listen: false).addItemToWishList(
        CartItemModel(
          id: widget.id,
          name: widget.title,
          image: widget.image,
          amount: 1,
          price: widget.offer == '0'
              ? double.tryParse(widget.price)
              : double.tryParse(widget.offer),
        ),
      );
    } else if (!_isFavourite) {
      await Provider.of<WishList>(context, listen: false).removeItem(index);
    }
  }

  void _addToCart() async {
    await Provider.of<Cart>(context, listen: false).addItemToCart(
      CartItemModel(
        id: widget.id,
        name: widget.title,
        price: widget.offer == '0'
            ? double.tryParse(widget.price)
            : double.tryParse(widget.offer),
        image: widget.image,
        amount: 1,
      ),
    );
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
    double offerNum = double.tryParse(widget.offer);
    double percent =
        100 - ((double.parse(widget.offer) / double.parse(widget.price)) * 100);
    final wishList = Provider.of<WishList>(context);
    int index = wishList.wishList.indexWhere((i) => i.id == widget.id);
    if (index != -1) {
      setState(() {
        _isFavourite = true;
      });
    }
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
            height: 100.0,
            width: 100.0,
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
                  'assets/images/iphoneTest.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                offerNum > 0
                    ? Container(
                        height: 20.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              7.0,
                            ),
                            bottomLeft: Radius.circular(
                              7.0,
                            ),
                          ),
                          color: Colors.white70,
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              '-' + percent.toString().split('.')[0] + '%',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    : new Container(),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  offerNum == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.price,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(
                              Icons.attach_money,
                              color: Colors.black,
                              size: 12.0,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.offer,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(
                              Icons.attach_money,
                              color: Colors.black,
                              size: 14.0,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              widget.price,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.grey,
                                fontSize: 14.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(
                              Icons.attach_money,
                              color: Colors.grey,
                              size: 14.0,
                            ),
                          ],
                        ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Color(0xffEA9307),
                        size: 20.0,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: 'Roboto',
                          fontSize: 14.0,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => _switchFavorite(index),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            5.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 18.0,
                            child: _isFavourite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20.0,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _addToCart,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            5.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 18.0,
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.black,
                              size: 20.0,
                            ),
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
