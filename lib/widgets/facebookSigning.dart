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
            color: Color(0xff1877F2),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Center(
            child: Text(
              'Sign With Facebook',
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
