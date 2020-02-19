import 'package:flutter/material.dart';
import '../mainScreens/tabBarCurrentScreen.dart';
import '../mainScreens/tabBarFinshedScreen.dart';

class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Orders',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.4,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: TabBar(
            tabs: [
              Text(
                'Current',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                'Finished',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabBarCurrentScreen(),
            TabBarFinishedScreen(),
          ],
        ),
      ),
    );
  }
}
