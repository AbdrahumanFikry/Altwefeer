import 'package:flutter/material.dart';

class CategoriesShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <int>[0, 1, 2]
          .map(
            (_) => Container(
              height: 135,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                vertical: 7.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2.0,
                    offset: Offset(
                      2.0,
                      2.0,
                    ),
                    blurRadius: 2.0,
                    color: Colors.grey[200],
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    5.0,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
