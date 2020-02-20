import 'package:flutter/material.dart';
import 'package:infinity/widgets/featureItem.dart';

class FeatureSelector extends StatelessWidget {
  final List featuresList;

  FeatureSelector({
    this.featuresList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 2.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Color',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return FeatureItem(
                              index: index,
                              content: 'XXl',
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
