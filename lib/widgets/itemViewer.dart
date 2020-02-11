import 'package:flutter/material.dart';
import '../mainScreens/detailScreen.dart';
import '../widgets/pageRoute.dart';

class ItemViewer extends StatefulWidget {
  final String title;
  final String image;
  final String price;
  final String offer;

  ItemViewer({
    this.title,
    this.image,
    this.price,
    this.offer,
  });

  @override
  _ItemViewerState createState() => _ItemViewerState();
}

class _ItemViewerState extends State<ItemViewer> {
  //------------------------------variables------------------------------------
  bool _isFavourite = false;

  //------------------------------methods--------------------------------------

  void _switchFavorite() {
    setState(() {
      _isFavourite = !_isFavourite;
    });
    //TODO ------
  }

  void _goToDetails() {
    //TODO ------
    Navigator.push(
      context,
      ScaleRoute(
        page: DetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double offerNum = double.parse(widget.offer);
    double percent =
        100 - ((double.parse(widget.offer) / double.parse(widget.price)) * 100);
    return GestureDetector(
      onTap: _goToDetails,
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              5.0,
            ),
          ),
        ),
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    widget.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: _switchFavorite,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 15.0,
                        child: _isFavourite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20.0,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 20.0,
                              ),
                      ),
                    ),
                  ),
                  Spacer(),
                  offerNum > 0
                      ? Container(
                          height: 20.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                7.0,
                              ),
                              bottomLeft: Radius.circular(
                                7.0,
                              ),
                            ),
                            color: Colors.white70,
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                '-' + percent.toString().split('.')[0] + '%',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      : new Container(),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 12.0,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
            ),
            Spacer(),
            offerNum == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.attach_money,
                        color: Colors.black,
                        size: 12.0,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.offer,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.attach_money,
                        color: Colors.black,
                        size: 12.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.grey,
                          fontSize: 8.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.attach_money,
                        color: Colors.grey,
                        size: 10.0,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
