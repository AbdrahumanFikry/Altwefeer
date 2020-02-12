import 'package:flutter/material.dart';

class FeatureItem extends StatefulWidget {
  final int index;
  final String content;

  FeatureItem({
    @required this.index,
    @required this.content,
  });

  @override
  _FeatureItemState createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem> {
  int _selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = widget.index;
        });
      },
      child: Container(
        height: 20.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal[800],
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
          color: _selected == widget.index ? Colors.teal[800] : Colors.white,
        ),
        child: FittedBox(
          child: Text(
            widget.content,
            style: TextStyle(
              color:
                  _selected == widget.index ? Colors.white : Colors.teal[800],
            ),
          ),
        ),
      ),
    );
  }
}
