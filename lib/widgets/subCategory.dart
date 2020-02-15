import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 7.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
    );
  }
}
