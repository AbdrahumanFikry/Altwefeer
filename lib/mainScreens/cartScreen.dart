import 'package:flutter/material.dart';
import '../models/cartItemModel.dart';
import 'package:provider/provider.dart';
import '../widgets/cartItem.dart';
import '../Providers/cartProvider.dart';

class CartScreen extends StatelessWidget {
  void _checkOut() {
    //TODO -----------
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Consumer<Cart>(
              builder: (context, cartItem, child) => ListView.builder(
                itemCount: cartItem.cartList.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider<CartItemModel>(
                    create: (context) => cartItem.cartList[index],
                    child: CartItem(),
                  );
                },
              ),
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
                      '435' + ' EGP ',
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
                      color: Colors.red,
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
