import 'package:flutter/material.dart';
import 'package:infinity/widgets/placeOrderInfo.dart';
import '../widgets/orderDetailProducts.dart';
class OrderDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Order Details',
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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('address',style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                  fontSize: 12.0,
                ),),
                Text('Mohamed Zayed',style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.outlined_flag,size: 20,),
                    SizedBox(width: 5.0,),
                    Expanded(
                      child: Text(
                        'Mansoura, Elgomhuria street, Elnekiby building, above dar elmaarefa library',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                          color: Color(0xff505050),
                        ),
                      ),
                    )
                  ],
                ),
                Divider()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Payment',style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                  fontSize: 13.0,
                ),),
                Text(
                  'Cash on delivery',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                Divider()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Products',style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                  fontSize: 12.0,
                ),),
                Text('6 items',style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                  fontSize: 12.0,
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: <Widget>[
                Text('deliverd at : ',style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                ),),
                Text('25/10/2020',style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
                  ),),

              ],
            ),
          ),
          OrderDetailProducts(
            image: 'assets/images/iphoneTest.png',
            title: 'The Scent By Hugo Boss For Men - Eau De Toilette, 50 ml',
            prise: '450',
            qty: '3',
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
        ],
      ),
    );
  }
}
