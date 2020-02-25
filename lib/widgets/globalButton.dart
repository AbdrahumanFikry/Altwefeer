import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTab;

  GlobalButton({
    @required this.buttonTitle,
    @required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xffD89900),
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
