import 'package:flutter/material.dart';

class RangeSelector extends StatefulWidget {
  @override
  _RangeSelectorState createState() => _RangeSelectorState();
}

class _RangeSelectorState extends State<RangeSelector> {
  var _selectedRange = RangeValues(0.0, 10000.0);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Price range',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'From',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _selectedRange.start.round().toString() + ' EGP',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'To',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _selectedRange.end.round().toString() + ' EGP',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        RangeSlider(
          min: 0.0,
          max: 10000.0,
          divisions: 1000,
          values: _selectedRange,
          onChanged: (RangeValues range) {
            setState(() {
              _selectedRange = range;
            });
          },
        ),
      ],
    );
  }
}
