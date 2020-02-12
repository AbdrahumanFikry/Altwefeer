import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/incrementalWidget.dart';
import '../models/cartItemModel.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final item = Provider.of<CartItemModel>(context);
    return Container(
      height: deviceWidth < 400 ? 110 : 90.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 10.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.0,
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
                        IncrementalWidget(),
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
                            IncrementalWidget(),
                          ],
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
