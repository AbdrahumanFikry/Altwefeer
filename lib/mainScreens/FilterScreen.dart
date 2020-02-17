import 'package:flutter/material.dart';
import 'package:infinity/widgets/globalButton.dart';
import '../widgets/RangeSelector.dart';
import '../widgets/filterItem.dart';

class FilterScreen extends StatelessWidget {
  final List<String> _filterItems = [
    'Jewelery',
    'Makeup',
    'Bodycare',
  ];

  void _applyFilter() {
    //TODO ----------
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Filter',
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
          ListView(
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  'Category',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: _filterItems.map((item) {
                  return FilterItem(title: item);
                }).toList(),
              ),
              ExpansionTile(
                title: Text(
                  'Brand',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: _filterItems.map((item) {
                  return FilterItem(title: item);
                }).toList(),
              ),
              RangeSelector(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GlobalButton(
                buttonTitle: 'Done',
                onTab: _applyFilter,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
