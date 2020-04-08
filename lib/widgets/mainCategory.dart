import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/categoriesScreen.dart';
import 'package:infinity/widgets/pageRoute.dart';


class MainCategory extends StatelessWidget {
  final String catName;
  final String img;
  MainCategory({
    this.img,
    this.catName,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  ScaleRoute(
                    page: CategoriesScreen(),
                  ),
                );
              },
              child: GridTile(
                  footer: Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: Text(
                        catName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: Image.asset(
                   img,
                    fit: BoxFit.cover,
                  )),
            ),
          )
    );
  }
}
