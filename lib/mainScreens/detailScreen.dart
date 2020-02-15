import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter/rendering.dart';
import '../mainScreens/addressBookScreen.dart';
import '../models/cartItemModel.dart';
import '../widgets/detailSliverList.dart';
import '../widgets/BottomSheet.dart';
import '../widgets/pageRoute.dart';
import '../mainScreens/cartScreen.dart';
import '../Providers/cartProvider.dart';
import 'package:provider/provider.dart';
import '../Providers/wishListProvider.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final String price;
  final String offer;

  DetailScreen({
    this.id,
    this.title,
    this.image,
    this.price,
    this.offer,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //----------------------------- variables -----------------------------------

  bool _isFavourite = false;
  bool _isAppbar = true;
  ScrollController _scrollController = new ScrollController();

  //------------------------------ methods ------------------------------------

  void _switchFavorite(int index) async {
    setState(() {
      _isFavourite = !_isFavourite;
    });
    if (_isFavourite) {
      await Provider.of<WishList>(context, listen: false).addItemToWishList(
        CartItemModel(
          id: widget.id,
          name: widget.title,
          image: widget.image,
          amount: 1,
          price: double.tryParse(widget.price),
        ),
      );
    } else if (!_isFavourite) {
      await Provider.of<WishList>(context, listen: false).removeItem(index);
    }
  }

  void _goToCart(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: CartScreen(),
      ),
    );
  }

  Future<void> _addToCart() async {
    await Provider.of<Cart>(context, listen: false).addItemToCart(
      CartItemModel(
        id: 11,
        name: 'Samsung S10+',
        image: 'assets/images/iphoneTest.png',
        amount: 1,
        price: 425,
      ),
    );
    //TODO ------
  }

  void _buyNow() {
    Navigator.push(
      context,
      FadeRoute(
        page: AddressBookScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        appBarStatus(false);
      }
      if (_scrollController.position.pixels == 0.0) {
        appBarStatus(true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void appBarStatus(bool status) {
    setState(() {
      _isAppbar = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<WishList>(context);
    int index = wishList.wishList.indexWhere((i) => i.id == widget.id);
    if (index != -1) {
      setState(() {
        _isFavourite = true;
      });
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Builder(
              builder: (context) => CustomScrollView(
                controller: _scrollController,
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
                          child: Consumer<Cart>(
                            builder: (context, cartItem, child) => CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 18.0,
                              child: cartItem.cartList.length == 0
                                  ? Icon(
                                      Icons.shopping_cart,
                                      color: Colors.black,
                                      size: 28.0,
                                    )
                                  : IconButton(
                                      icon: Badge(
                                        animationType: BadgeAnimationType.scale,
                                        badgeColor: Colors.red,
                                        shape: BadgeShape.circle,
                                        animationDuration:
                                            Duration(microseconds: 200),
                                        toAnimate: true,
                                        elevation: 5.0,
                                        position: BadgePosition.topLeft(
                                          left: 5.0,
                                        ),
                                        badgeContent: Text(
                                          cartItem.cartList.length.toString(),
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
                                      onPressed: () => _goToCart(context),
                                    ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _switchFavorite(index),
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
                      expandedHeight: _isAppbar ? 260.0 : 40.0,
                      pinned: true,
                      floating: false,
                      flexibleSpace: _isAppbar
                          ? FlexibleSpaceBar(
                              collapseMode: CollapseMode.pin,
                              centerTitle: true,
                              background: Image.asset(
                                'assets/images/iphoneTest.png',
                              ),
                            )
                          : FlexibleSpaceBar(
                              collapseMode: CollapseMode.pin,
                              centerTitle: true,
                              title: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    'Samsung S10+ - asdxd bvnhvn jaaa, mkcmsckmsk 50',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )),
                            )),
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
                      BottomSheetAction(
                        buttonTitle: 'Buy Now',
                        onTab: _buyNow,
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width / 2 - 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xffD9EEFF),
                            borderRadius: BorderRadius.circular(
                              100.0,
                            ),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Color(0xff008BFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      BottomSheetAction(
                        buttonTitle: 'Add TO Cart',
                        onTab: _addToCart,
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width / 2 - 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xff008BFF),
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
