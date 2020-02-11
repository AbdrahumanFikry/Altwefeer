import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '../widgets/detailSliverList.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //------------------------------variables------------------------------------

  bool _isFavourite = false;
  int count = 0;

  //-------------------------------methods-------------------------------------

  void _switchFavorite() {
    setState(() {
      _isFavourite = !_isFavourite;
    });
    //TODO ------
  }

  void _goToCart() {
    //TODO -------
  }

  void _addToCart() {
    setState(() {
      count++;
    });
    //TODO ------
  }

  void _buyNow() {
    //TODO ------
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Builder(
              builder: (context) => CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 16.0,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 22.0,
                          ),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 18.0,
                          child: IconButton(
                            icon: Badge(
                              animationType: BadgeAnimationType.slide,
                              badgeColor: Colors.red,
                              shape: BadgeShape.circle,
                              animationDuration: Duration(microseconds: 200),
                              toAnimate: true,
                              elevation: 5.0,
                              position: BadgePosition.topLeft(
                                left: 5.0,
                              ),
                              badgeContent: Text(
                                count.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 28.0,
                              ),
                            ),
                            onPressed: _goToCart,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _switchFavorite,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 18.0,
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
                    ],
                    backgroundColor: Colors.white,
                    expandedHeight: 260.0,
                    pinned: true,
                    floating: false,
                    flexibleSpace: new FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      titlePadding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        right: 20.0,
                        top: 5.0,
                      ),
                      centerTitle: true,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            left: 10.0,
                          ),
                          child: new Text(
                            'Samsung S10+ - asdxd bvnhvn jaaa,  50sdfdfcd afvfvf fvfvffvfv dcscascda asasqwdwsxzsxs',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                            //overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ),
                      background: Image.asset(
                        'assets/images/iphoneTest.png',
                      ),
                    ),
                  ),
                  DetailSliverList(
                    title: 'Samsung S10+ - asdxd bvnhvn jaaa, mkcmsckmsk 50',
                    price: '5000',
                    offer: '4652',
                    image: '',
                    reviews: '(190)',
                    description:
                        'We have eliminated distractions for a cinematic viewing experience. By utilizing precise laser cutting, the camera has been discreetly tucked away within the display without sacrificing photo quality.',
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 65.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: _buyNow,
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width / 2 - 60.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(
                              100.0,
                            ),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _addToCart,
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width / 2 - 50.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              100.0,
                            ),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}