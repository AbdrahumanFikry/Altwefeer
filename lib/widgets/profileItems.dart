import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  ProfileItems({this.title, this.icon,this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
