import 'package:flutter/material.dart';
import '../mainScreens/detailScreen.dart';
import '../widgets/pageRoute.dart';
import '../Providers/wishListProvider.dart';
import 'package:provider/provider.dart';
import '../models/cartItemModel.dart';

class ItemViewer extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final String price;
  final String offer;

  ItemViewer({
    this.id,
    this.title,
    this.image,
    this.price,
    this.offer,
  });

  @override
  _ItemViewerState createState() => _ItemViewerState();
}

class _ItemViewerState extends State<ItemViewer> {
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

  void _goToDetails() {
    Navigator.push(
      context,
      ScaleRoute(
        page: DetailScreen(
          id: widget.id,
          title: widget.title,
          price: widget.price,
          image: widget.image,
          offer: widget.offer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double offerNum = double.parse(widget.offer);
    double percent =
        100 - ((double.parse(widget.offer) / double.parse(widget.price)) * 100);
    final wishList = Provider.of<WishList>(context);
    int index = wishList.wishList.indexWhere((i) => i.id == widget.id);
    if (index != -1) {
      setState(() {
        _isFavourite = true;
      });
    }
    return GestureDetector(
      onTap: _goToDetails,
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              5.0,
            ),
          ),
        ),
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    widget.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _switchFavorite(index),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 15.0,
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
                  Spacer(),
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
                            color: Color(0xffFFE1E0),
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
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 12.0,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
            ),
            Spacer(),
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
          ],
        ),
      ),
    );
  }
}
