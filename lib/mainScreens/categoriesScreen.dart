import 'package:flutter/material.dart';
import 'package:infinity/widgets/categoriesShimmer.dart';
import 'package:infinity/widgets/loader.dart';
import '../widgets/subCategorySelector.dart';
import '../widgets/subCategory.dart';
import '../widgets/pageRoute.dart';
import 'package:provider/provider.dart';
import '../Providers/cartProvider.dart';
import '../mainScreens/cartScreen.dart';
import 'package:badges/badges.dart';
import '../widgets/animatedList.dart';
import '../mainScreens/searchScreen.dart';
import '../Providers/categoriesProvider.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  //----------------------------- variables ------------------------------------
  int _selected = 0;
  Duration _duration = Duration(milliseconds: 100);

  List<String> _categories = ["1", "2", "3", "4"];

  final SearchScreen _searchItems = SearchScreen(
    [
      'aaaaa',
      'bbbbbbbbbbbb',
      'ccccccccccccc',
    ],
  );

  //------------------------------ methods -------------------------------------

  void _select(int index) {
    setState(() {
      _selected = index;
    });
  }

  void _goToCart(BuildContext context) {
    Navigator.of(context).push(
      ScaleRoute(
        page: CartScreen(),
      ),
    );
  }

  void _goToSearch() async {
    await showSearch<String>(
      context: context,
      delegate: _searchItems,
    );
  }

  @override
  Widget build(BuildContext context) {
//    Provider.of<Cart>(context, listen: false).fetchData();
    final categories = Provider.of<CategoriesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: GestureDetector(
          onTap: _goToSearch,
          child: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25.0,
                ),
              ),
              border: Border.all(
                color: Colors.grey[500],
                width: 1.0,
              ),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (context, cartItems, child) => IconButton(
              icon: cartItems.cartList.length == 0
                  ? Image.asset('assets/icons/cart.png')
                  : Badge(
                      animationType: BadgeAnimationType.scale,
                      badgeColor: Colors.red,
                      shape: BadgeShape.circle,
                      animationDuration: Duration(microseconds: 200),
                      toAnimate: true,
                      elevation: 5.0,
                      position: BadgePosition.topRight(
                        right: 3.0,
                        top: 0.0,
                      ),
                      badgeContent: Text(
                        cartItems.cartList.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      child: Tab(
                        icon: new Image.asset(
                          'assets/icons/cart.png',
                        ),
                      ),
                    ),
              onPressed: () => _goToCart(context),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: categories.categories == null
            ? Provider.of<CategoriesProvider>(context, listen: false)
                .fetchCategories()
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
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: ListView.builder(
                    itemCount: categories.categories.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _select(index),
                        child: SubCategorySelector(
                          title: categories.categories.data[index].name,
                          selected: _selected,
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
//                Expanded(
//                  child: Shimmer.fromColors(
//                    baseColor: Colors.grey[300],
//                    highlightColor: Colors.grey[100],
//                    enabled: true,
//                    child: CategoriesShimmer(),
//                  ),
//                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[400],
                    child: ListViewEffect(
                      duration: _duration,
                      children: _categories
                          .map(
                            (item) => SubCategory(
                              title: 'Make up',
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
