import 'package:flutter/material.dart';

class SubCategorySelector extends StatelessWidget {
  final String title;
  final int selected;
  final int index;

  SubCategorySelector({
    this.title,
    this.selected,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: selected == index ? Colors.blue[50] : Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            height: 60.0,
            width: 7.0,
            color: selected == index ? Colors.blue[800] : Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                color: selected == index ? Colors.blue[800] : Colors.black,
                fontFamily: 'Roboto',
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
