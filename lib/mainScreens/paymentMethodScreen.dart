import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          'Address book',
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
              //ToDo
            }),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0,),
          GestureDetector(
            onTap: (){
              //ToDo
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text('Cash On Delivery',style: TextStyle(color: Colors.black,fontSize: 15.0,fontFamily: 'Roboto'),),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                ],
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: (){
              //ToDo
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text('Payment Method',style: TextStyle(color: Colors.black,fontSize: 15.0,fontFamily: 'Roboto'),),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
