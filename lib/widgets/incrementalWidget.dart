import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cartItemModel.dart';
import '../Providers/cartProvider.dart';

class IncrementalWidget extends StatefulWidget {
  final CartItemModel item;

  IncrementalWidget({
    this.item,
  });

  @override
  _IncrementalWidgetState createState() => _IncrementalWidgetState();
}

class _IncrementalWidgetState extends State<IncrementalWidget> {
  bool changed = false;
  int num;

  @override
  Widget build(BuildContext context) {
    if (!changed) {
      num = widget.item.amount;
    }
    final cart = Provider.of<Cart>(context);
//    final item = Provider.of<CartItemModel>(context);
    return Row(
      children: <Widget>[
        Container(
          height: 30.0,
          width: 30.0,
          margin: EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.teal[800],
              width: 2.0,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                5.0,
              ),
              bottomLeft: Radius.circular(
                5.0,
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              if (num > 1) {
                cart.removeAmount(widget.item.id);
                cart.fetchData();
                setState(() {
                  changed = true;
                  num--;
                });
              }
            },
            child: Icon(
              Icons.remove,
              color: Colors.teal[800],
            ),
          ),
        ),
        Container(
          height: 30.0,
          width: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.teal[800],
              width: 2.0,
            ),
          ),
          margin: EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                num.toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 30.0,
          width: 30.0,
          margin: EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.teal[800],
              width: 2.0,
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                5.0,
              ),
              bottomRight: Radius.circular(
                5.0,
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              cart.addItemToCart(widget.item);
              cart.fetchData();
              setState(() {
                changed = true;
                num++;
              });
            },
            child: Icon(
              Icons.add,
              color: Colors.teal[800],
            ),
          ),
        ),
      ],
    );
  }
}
