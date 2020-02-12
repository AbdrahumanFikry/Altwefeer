import 'package:flutter/material.dart';
import '../widgets/addressBookItem.dart';

class AddressBookScreen extends StatelessWidget {
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
      body: AddressBookItem(),
    );
  }
}
