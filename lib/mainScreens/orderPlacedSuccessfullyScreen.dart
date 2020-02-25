import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/tabBarScreen.dart';
import 'package:infinity/widgets/globalButton.dart';
import 'package:infinity/widgets/pageRoute.dart';

class OrderPlacedSuccessfullyScreen extends StatelessWidget {
  void _trackOrder(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: TabBarScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Text(
                  'Oeder is Placed Successfully',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  'Now you can track your order',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 16.0,
                ),
                child: GlobalButton(
                  buttonTitle: 'Track Order',
                  onTab: () =>_trackOrder(context),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
