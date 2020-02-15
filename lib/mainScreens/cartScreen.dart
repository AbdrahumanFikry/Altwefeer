import 'package:flutter/material.dart';
import '../models/cartItemModel.dart';
import 'package:provider/provider.dart';
import '../widgets/cartItem.dart';
import '../Providers/cartProvider.dart';
import '../widgets/EmptyScreen.dart';

class CartScreen extends StatelessWidget {
  void _checkOut() {
    //TODO -----------
  }

  void _emptyCart(BuildContext context) {
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
          'Do you want to empty Cart?',
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
              await Provider.of<Cart>(context, listen: false).emptyCart();
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
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Text(
          'Cart',
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
          cart.cartList.length == 0
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17.0,
                    horizontal: 5.0,
                  ),
                  child: InkWell(
                    splashColor: Colors.redAccent,
                    onTap: () => _emptyCart(context),
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
      body: cart.cartList.length == 0
          ? EmptyScreen(
              title: 'Empty cart',
              subTitle: 'Continue shopping and add to cart',
            )
          : Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: cart.cartList.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider<CartItemModel>(
                        create: (context) => cart.cartList[index],
                        child: CartItem(),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Spacer(),
                          Text(
                            cart.returnTotal().toString() + ' EGP ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: _checkOut,
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 20.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff008BFF),
                            borderRadius: BorderRadius.circular(
                              100.0,
                            ),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
