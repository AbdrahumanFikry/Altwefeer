import 'package:flutter/material.dart';

class PaymentData extends StatelessWidget {
  final String numberOfCard;
  final Function onTap;

  PaymentData({
    this.onTap,
    this.numberOfCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Tab(
                        icon: new Image.asset(
                          'assets/icons/payment.png',
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        numberOfCard.substring(0, 4) + '************',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
