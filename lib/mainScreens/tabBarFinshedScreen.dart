import 'package:flutter/material.dart';
import 'package:infinity/widgets/finishedOrederItem.dart';

class TabBarFinishedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return FinishedOrderItem(
            date: '27/12/2019',
            price: '450',
          );
        },
      ),
    );
  }
}
