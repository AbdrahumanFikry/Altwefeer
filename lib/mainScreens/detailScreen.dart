import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter/rendering.dart';
import 'package:infinity/widgets/detailSlider.dart';
import 'package:infinity/widgets/loader.dart';
import '../mainScreens/addressBookScreen.dart';
import '../models/cartItemModel.dart';
import '../widgets/detailSliverList.dart';
import '../widgets/BottomSheet.dart';
import '../widgets/pageRoute.dart';
import '../mainScreens/cartScreen.dart';
import '../Providers/cartProvider.dart';
import 'package:provider/provider.dart';
import '../Providers/wishListProvider.dart';
import '../Providers/productsProvider.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  DetailScreen({
    this.id,
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

  void _switchFavorite(
      int index, String name, String image, String price) async {
    _isFavourite = !_isFavourite;
    if (_isFavourite) {
      await Provider.of<WishList>(context, listen: false).addItemToWishList(
        CartItemModel(
          id: widget.id,
          name: name,
          image: image,
          amount: 1,
          price: double.tryParse(price),
        ),
      );
    } else if (!_isFavourite) {
      await Provider.of<WishList>(context, listen: false).removeItem(
        CartItemModel(
          id: widget.id,
          name: name,
          image: image,
          amount: 1,
          price: double.tryParse(price),
        ),
      );
    }
  }

  void _goToCart(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: CartScreen(),
      ),
    );
  }

  Future<void> _addToCart(String name, String image, String price) async {
    await Provider.of<Cart>(context, listen: false).addItemToCart(
      CartItemModel(
        id: widget.id,
        name: name,
        image: image,
        amount: 1,
        price: double.tryParse(price),
      ),
    );
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
    Provider.of<ProductsProvider>(context, listen: false).singleProduct = null;
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
      _isFavourite = true;
    }
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Provider.of<ProductsProvider>(context, listen: false)
                      .singleProduct ==
                  null
              ? Provider.of<ProductsProvider>(context, listen: false)
                  .fetchSingleProducts(id: widget.id)
              : null,
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(
                child: ColorLoader(),
              );
            } else {
              if (dataSnapShot.error != null) {
                return Center(
                  child: Text(
                    'Check internet connection!',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                );
              } else {
                return Consumer<ProductsProvider>(
                  builder: (context, item, child) => Stack(
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
                                    builder: (context, cartItem, child) =>
                                        CircleAvatar(
                                      backgroundColor: Colors.grey[200],
                                      radius: 19.0,
                                      child: cartItem.cartList.length == 0
                                          ? GestureDetector(
                                              onTap: () {
                                                _goToCart(context);
                                              },
                                              child: Container(
                                                child: Image.asset(
                                                  'assets/icons/cart.png',
                                                ),
                                              ),
                                            )
                                          : IconButton(
                                              icon: Badge(
                                                animationType:
                                                    BadgeAnimationType.scale,
                                                badgeColor: Colors.red,
                                                shape: BadgeShape.circle,
                                                animationDuration:
                                                    Duration(microseconds: 200),
                                                toAnimate: true,
                                                elevation: 5.0,
                                                position: BadgePosition.topLeft(
                                                  left: 4.0,
                                                ),
                                                badgeContent: Text(
                                                  cartItem.cartList.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.0,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  'assets/icons/cart.png',
                                                ),
                                              ),
                                              onPressed: () =>
                                                  _goToCart(context),
                                            ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _switchFavorite(
                                    index,
                                    item.singleProduct.data.name,
                                    item.singleProduct.data.images[0].path,
                                    item.singleProduct.data.price.toString(),
                                  ),
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
                                              size: 30.0,
                                            )
                                          : Icon(
                                              Icons.favorite_border,
                                              color: Colors.black
                                                  .withOpacity(0.65),
                                              size: 30.0,
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
                                      background: DetailSlider(
                                        images: item.singleProduct.data.images,
                                      ),
                                    )
                                  : FlexibleSpaceBar(
                                      collapseMode: CollapseMode.pin,
                                      centerTitle: true,
                                      title: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Text(
                                          item.singleProduct.data.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                            ),
                            DetailSliverList(
                              title: item.singleProduct.data.name,
                              price: item.singleProduct.data.price.toString(),
                              offer: '0',
                              images: item.singleProduct.data.images,
                              reviews: item.singleProduct.data.reviews,
                              description: item.singleProduct.data.description,
                              features: [],
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
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            60.0,
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xffD89900).withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(
                                        100.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          'Buy Now',
                                          style: TextStyle(
                                            color: Color(0xffD89900),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                BottomSheetAction(
                                  buttonTitle: 'Add to Cart',
                                  onTab: () => _addToCart(
                                    item.singleProduct.data.name,
                                    item.singleProduct.data.images[0].path,
                                    item.singleProduct.data.price.toString(),
                                  ),
                                  child: Container(
                                    height: 42,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffD89900),
                                      borderRadius: BorderRadius.circular(
                                        100.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          'Add to Cart',
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
                );
              }
            }
          },
        ),
      ),
    );
  }
}
