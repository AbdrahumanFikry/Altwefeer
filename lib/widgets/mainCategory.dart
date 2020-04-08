import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/categoriesScreen.dart';
import 'package:infinity/widgets/pageRoute.dart';

class MainCategory extends StatelessWidget {
  final String title;
  final String image;

  MainCategory({
    this.image,
    this.title,
  });

  void _goToCategory(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: CategoriesScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () => _goToCategory(context),
        child: GridTile(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: 0.0,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 2) * 0.7,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
