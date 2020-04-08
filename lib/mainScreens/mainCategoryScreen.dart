import 'package:flutter/material.dart';
import '../widgets/mainCategory.dart';
class MainCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Category',style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
        ),),
        backgroundColor: Colors.white,
        elevation: 0.3,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);}),
      ),
      body: GridView.builder(
          itemCount: 4,
          gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: MainCategory(
                catName: 'Electronics',
                img: 'assets/images/electronicsImg.jpg',
              )
            );
          }),
    );
  }
}
