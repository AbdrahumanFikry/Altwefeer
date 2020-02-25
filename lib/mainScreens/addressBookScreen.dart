import 'package:flutter/material.dart';
import '../mainScreens/paymentMethodScreen.dart';
import '../widgets/globalButton.dart';
import '../widgets/pageRoute.dart';
import '../widgets/addressBookItem.dart';

class AddressBookScreen extends StatefulWidget {
  final bool showOnly;

  AddressBookScreen({
    this.showOnly = false,
  });

  @override
  _AddressBookScreenState createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  //----------------------------- variables ------------------------------------
  int groupValue = 0;

  //------------------------------ methods -------------------------------------

  void onChanged(int value) {
    setState(() {
      groupValue = value;
      print(groupValue.toString());
    });
  }

  void _continueToPayment(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(
        page: PaymentMethodScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'Address book',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return AddressBookItem(
                index: index,
                groupValue: groupValue,
                onChanged: onChanged,
                showOnly: widget.showOnly,
              );
            },
          ),
          widget.showOnly
              ? Container()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 7.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            color: Color(0xffD89900),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2.5,
                          ),
                        ),
                        Container(
                          height: 7.0,
                          width: 7.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2.5,
                          ),
                        ),
                        Container(
                          height: 7.0,
                          width: 7.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2.5,
                          ),
                        ),
                      ],
                    ),
                    GlobalButton(
                      buttonTitle: 'Continue to payment',
                      onTab: () => _continueToPayment(context),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
