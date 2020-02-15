import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/addressBookScreen.dart';
import 'package:infinity/widgets/pageRoute.dart';
import '../widgets/quantitySelector.dart';
import '../widgets/featuresSelector.dart';

class BottomSheetAction extends StatelessWidget {
  final Widget child;
  final Function onTab;
  final String buttonTitle;

  BottomSheetAction({
    @required this.child,
    @required this.onTab,
    @required this.buttonTitle,
  });

  Future<void> _action(BuildContext context) async {
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (builder) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //------------------------- Header ---------------------------------
            Container(
              height: 90.0,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 80.0,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/iphoneTest.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'asasasass',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '400',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //------------------------- Content --------------------------------
            FeatureSelector(),
            Container(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 2.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Quantity',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  QuantitySelector(),
                ],
              ),
            ),
            //------------------------- Footer ---------------------------------
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  FadeRoute(
                    page: AddressBookScreen(),
                  ),
                );
                onTab();
              },
              child: Container(
                height: 42,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff008BFF),
                  borderRadius: BorderRadius.circular(
                    100.0,
                  ),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      buttonTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _action(context),
      child: child,
    );
  }
}
