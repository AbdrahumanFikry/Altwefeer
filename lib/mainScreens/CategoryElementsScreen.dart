import 'package:flutter/material.dart';
import 'package:infinity/models/singleCategory.dart';
import '../mainScreens/FilterScreen.dart';
import '../mainScreens/detailScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/subElement.dart';

class CategoryElementsScreen extends StatelessWidget {
  final String title;
  final List<Products> allItems;

  CategoryElementsScreen({
    this.title,
    this.allItems,
  });

  void _filter(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: FilterScreen(),
      ),
    );
  }

  void _goToDetailsScreen(BuildContext context, int id, String title,
      String price, String image, String offer) {
    Navigator.of(context).push(
      ScaleRoute(
        page: DetailScreen(
          id: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          title,
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
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/filter.png'),
            onPressed: () => _filter(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _goToDetailsScreen(
                context,
                index,
                'Apple Iphone X With Facetime - 64 GB, 4G LTE, Space Grey ',
                '5000',
                'assets/images/iphoneTest.png',
                '4200'),
            child: SubElement(
              id: index,
              title:
                  'Apple Iphone X With Facetime - 64 GB, 4G LTE, Space Grey ',
              price: '5000',
              image: 'assets/images/iphoneTest.png',
              offer: '4200',
            ),
          );
        },
      ),
    );
  }
}
