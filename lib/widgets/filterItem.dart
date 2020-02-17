import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  final String title;

  FilterItem({
    this.title,
  });

  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool _selected = false;

  void _onChanged(bool value) {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: _selected,
          onChanged: _onChanged,
          checkColor: Colors.white,
          activeColor: Colors.deepOrange,
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
