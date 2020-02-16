import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/incrementalWidget.dart';
import '../models/cartItemModel.dart';
import '../Providers/cartProvider.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final item = Provider.of<CartItemModel>(context);
    final cart = Provider.of<Cart>(context);
    int index = cart.cartList.indexWhere((i) => i.id == item.id);
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure ?',
              style: TextStyle(color: Colors.blue),
            ),
            content: Text(
              'Do you want to remove this item from Cart?',
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(
          bottom: 7.0,
          top: 7.0,
          right: 0.0,
          left: 7.0,
        ),
        padding: const EdgeInsets.only(
          right: 1.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 30.0,
            ),
          ],
        ),
      ),
      onDismissed: (direction) async {
        try {
          await Provider.of<Cart>(context, listen: false).removeItem(index);
        } catch (error) {
          print(':::::::::::::::::::' + error.toString());
        }
      },
      child: Container(
        height: deviceWidth < 400 ? 110 : 90.0,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 10.0,
          right: 0.0,
          top: 2.0,
          bottom: 2.0,
        ),
        padding: EdgeInsets.only(
          left: 5.0,
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
                child: deviceWidth < 400
                    ? Column(
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
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Total: ',
                                        style: TextStyle(
                                          color: Colors.teal[400],
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      Text(
                                        (item.amount * item.price).toString() +
                                            ' EGP',
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
                          Expanded(
                              child: IncrementalWidget(
                            amount: 0,
                          )),
                        ],
                      )
                    : Column(
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
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Total: ',
                                        style: TextStyle(
                                          color: Colors.teal[400],
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      Text(
                                        cart.returnAllPrice(item).toString() +
                                            ' EGP',
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
                              IncrementalWidget(
                                amount: item.amount,
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            Container(
              height: deviceWidth < 400 ? 100 : 80.0,
              width: 5.0,
              decoration: BoxDecoration(
                color: Theme.of(context).errorColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    5.0,
                  ),
                  topLeft: Radius.circular(
                    5.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
