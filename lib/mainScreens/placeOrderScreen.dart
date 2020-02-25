import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/addressBookScreen.dart';
import 'package:infinity/mainScreens/orderPlacedSuccessfullyScreen.dart';
import 'package:infinity/widgets/globalButton.dart';
import 'package:infinity/widgets/pageRoute.dart';
import '../widgets/placeOrderInfo.dart';

class PlaceOrderScreen extends StatelessWidget {
  void _placeOrder(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(
        page: OrderPlacedSuccessfullyScreen(),
      ),
    );
  }

  void _changePaymentMethod(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _changeAddress(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      FadeRoute(
        page: AddressBookScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Place Order',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          PlaceOrderInfo(
            title: 'Subtotal',
            price: '435',
          ),
          PlaceOrderInfo(
            title: 'Delivery fees',
            price: '15',
          ),
          Divider(),
          PlaceOrderInfo(
            title: 'Grand total',
            price: '450',
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Cash On Deleviry',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 17.0,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () => _changePaymentMethod(context),
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: Color(0xffD89900),
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Mohamed Zeyad',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => _changeAddress(context),
                      child: Text(
                        'Change',
                        style: TextStyle(
                          color: Color(0xffD89900),
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 0.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.outlined_flag,
                      ),
                      Text(
                        'Almaadi, Ahmed Saad 21',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 7.0,
                width: 7.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 2.5,
                ),
              ),
              Container(
                height: 7.0,
                width: 7.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 2.5,
                ),
              ),
              Container(
                height: 7.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: Color(0xffD89900),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 2.5,
                ),
              ),
            ],
          ),
          GlobalButton(
            buttonTitle: 'Place order',
            onTab: () => _placeOrder(context),
          )
        ],
      ),
    );
  }
}
