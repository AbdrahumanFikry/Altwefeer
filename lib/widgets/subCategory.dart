import 'package:flutter/material.dart';
import 'package:infinity/mainScreens/CategoryElementsScreen.dart';
import 'package:infinity/mainScreens/detailScreen.dart';
import '../widgets/pageRoute.dart';
import '../widgets/metaSubCategoryItem.dart';

class SubCategory extends StatelessWidget {
  final String title;

  SubCategory({
    this.title,
  });

  void _goToDetails(BuildContext context) {
    Navigator.push(
      context,
      ScaleRoute(
        page: DetailScreen(
          title: 'Samsung S10+ - asdxd bvnhvn jaaa, mkcmsckmsk 50',
          price: '5000',
          offer: '4652',
          image: '',
          id: 100,
        ),
      ),
    );
  }

  void _goToAll(BuildContext context) {
    Navigator.push(
      context,
      ScaleRoute(
        page: CategoryElementsScreen(
          title: 'Make up',
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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _goToDetails(context),
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
