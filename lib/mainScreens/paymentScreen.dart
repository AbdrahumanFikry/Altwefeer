import 'package:flutter/material.dart';
import '../widgets/paymentForm.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Payment',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Form(
                  child: Column(
                    children: <Widget>[
                      PaymentForm(
                        hintText: 'Name On Card',
                      ),
                      PaymentForm(
                        hintText: 'Card number',
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: PaymentForm(
                              hintText: 'Expiry date',
                            ),
                          ),
                          Flexible(
                            child: PaymentForm(
                              hintText: 'CVV',
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),
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
                    child: Text('Add Payment',style: TextStyle(
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
      )
    );
  }
}
