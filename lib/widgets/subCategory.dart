import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/CategoryElementsScreen.dart';
import 'package:infinity/mainScreens/detailScreen.dart';
import 'package:infinity/models/singleCategory.dart';
import '../widgets/pageRoute.dart';
import '../widgets/metaSubCategoryItem.dart';

class SubCategory extends StatelessWidget {
  final String title;
  final List<Products> items;

  SubCategory({
    this.title,
    this.items,
  });

  void _goToDetails(BuildContext context, int id) {
    Navigator.push(
      context,
      ScaleRoute(
        page: DetailScreen(
          id: id,
        ),
      ),
    );
  }

  void _goToAll(BuildContext context) {
    Navigator.push(
      context,
      ScaleRoute(
        page: CategoryElementsScreen(
          title: title,
          allItems: items,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 7.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            offset: Offset(
              2.0,
              2.0,
            ),
            blurRadius: 2.0,
            color: Colors.grey[200],
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(
            5.0,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => _goToAll(context),
            child: Container(
              height: 35.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    5.0,
                  ),
                  topRight: Radius.circular(
                    5.0,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Spacer(),
                  Text(
                    'All',
                    style: TextStyle(
                      color: Color(0xffD89900),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffD89900),
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  5.0,
                ),
                bottomRight: Radius.circular(
                  5.0,
                ),
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _goToDetails(context, items[index].id),
                  child: MetaSubCategoryItem(
                    title: items[index].name,
                    image: items[index].images[0].path,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
