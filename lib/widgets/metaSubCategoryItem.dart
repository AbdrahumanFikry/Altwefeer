import 'package:flutter/material.dart';

class MetaSubCategoryItem extends StatelessWidget {
  final String title;
  final String image;

  MetaSubCategoryItem({
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 70.0,
      color: Colors.white,
      margin: EdgeInsets.all(
        9.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 2.5,
              left: 2.0,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
