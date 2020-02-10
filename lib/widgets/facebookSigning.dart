import 'package:flutter/material.dart';

class FaceBookSigning extends StatelessWidget {
  final Function onTab;

  FaceBookSigning({
    @required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 43, left: 43),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          height: 42,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(59, 87, 157, 10),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30.0,
                child: Image.asset(
                  'assets/images/facebook.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Sign With Facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
