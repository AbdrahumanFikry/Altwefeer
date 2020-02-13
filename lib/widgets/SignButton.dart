import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTab;

  SignButton({
    @required this.buttonTitle,
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
            color: Color(0xff008BFF),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
