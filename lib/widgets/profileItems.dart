import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final String notifications;

  ProfileItems({
    this.title,
    this.icon,
    this.onTap,
    this.notifications,
  });

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
                  Spacer(),
                  notifications != null
                      ? notifications == '0'
                          ? SizedBox()
                          : Badge(
                              elevation: 2.0,
                              badgeContent: Padding(
                                padding: const EdgeInsets.all(
                                  2.0,
                                ),
                                child: Text(
                                  notifications,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.5,
                                horizontal: 8.0,
                              ),
                            )
                      : SizedBox(),
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
