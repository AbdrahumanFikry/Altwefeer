import 'package:flutter/material.dart';

class SubCategorySelector extends StatelessWidget {
  final String title;
  final int selected;
  final int index;

  SubCategorySelector({
    this.title,
    this.selected,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: selected == index ? Color(0xffD89900).withOpacity(0.10) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 1.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 60.0,
              width: 7.0,
              color: selected == index ? Color(0xffD89900) : Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                    color: selected == index ? Color(0xffD89900) : Colors.black,
                    fontFamily: 'Roboto',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
