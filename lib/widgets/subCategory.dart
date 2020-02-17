import 'package:flutter/material.dart';
import '../mainScreens/CategoryElementsScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/metaSubCategoryItem.dart';

class SubCategory extends StatelessWidget {
  final String title;

  SubCategory({
    this.title,
  });

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
          Container(
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
                    color: Colors.blue,
                    fontFamily: 'Roboto',
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 16.0,
                ),
              ],
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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      ScaleRoute(
                        page: CategoryElementsScreen(
                          title: 'Perfume',
                        ),
                      ),
                    );
                  },
                  child: MetaSubCategoryItem(
                    title: 'Perfume',
                    image: 'assets/images/iphoneTest.png',
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
