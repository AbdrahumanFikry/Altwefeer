import 'package:flutter/material.dart';
import '../widgets/placeOrderInfo.dart';

class PlaceOrderScreen extends StatelessWidget {
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
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(height: 20.0,),
              PlaceOrderInfo(
                title: 'Subtotal',
                prise: '435',
              ),
              PlaceOrderInfo(
                title: 'Delivery fees',
                prise: '15',
              ),
              Divider(),
              PlaceOrderInfo(
                title: 'Grand total',
                prise: '450',
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right:16.0,left: 16.0,bottom: 2.0),
            child: GestureDetector(
              onTap: (){
                //Todo
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff008BFF),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Center(
                    child: Text('Place order',style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
