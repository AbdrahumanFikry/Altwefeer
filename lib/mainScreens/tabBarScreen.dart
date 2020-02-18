import 'package:flutter/material.dart';
import '../mainScreens/tabBarCurrentScreen.dart';
import '../mainScreens/tabBarFinshedScreen.dart';
class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor: Colors.white,
                bottom: TabBar(
                    tabs: [
                      Text('Current',style: TextStyle(fontSize: 18.0,fontFamily: 'Roboto'),),
                      Text('Finished',style: TextStyle(fontSize: 18.0,fontFamily: 'Roboto')),
                    ]
                ),
              ),
            ),
            body: TabBarView(
                children: [
                  TabBarCurrentScreen(),
                  TabBarFinishedScreen(),
                ]
            ),
          )
      );

  }
}
