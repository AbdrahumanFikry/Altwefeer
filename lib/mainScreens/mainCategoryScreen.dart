import 'package:flutter/material.dart';
import '../widgets/mainCategory.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.blue,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.3,
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 10,
        staggeredTileBuilder: (int index) => new StaggeredTile.count(
          2,
          index.isEven ? 2 : 1,
        ),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        itemBuilder: (BuildContext context, int index) {
          return MainCategory(
            title: 'Electronics',
            image: 'assets/images/electronicsImg.jpg',
          );
        },
      ),
    );
  }
}
