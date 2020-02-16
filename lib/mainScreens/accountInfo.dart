import 'package:flutter/material.dart';
import '../widgets/accountInfoWidget.dart';
class AccountInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Settings',
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
          AccountInfoWidget(
            editStatues: 'Mohammed Esaam',
          ),
          AccountInfoWidget(
            editStatues: 'me6636366@gmail.com',
          ),
          AccountInfoWidget(
            editStatues: 'change password',
          )
        ],
      ),
    );
  }
}
