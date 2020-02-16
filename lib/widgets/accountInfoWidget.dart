import 'package:flutter/material.dart';

class AccountInfoWidget extends StatelessWidget {
  final String editStatues;
  AccountInfoWidget({this.editStatues});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      editStatues,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
        Divider()
      ],
    );
  }
}
