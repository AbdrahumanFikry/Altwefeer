import 'package:flutter/material.dart';
import '../widgets/subCategorySelector.dart';
import '../widgets/subCategory.dart';
import '../widgets/pageRoute.dart';
import 'package:provider/provider.dart';
import '../Providers/cartProvider.dart';
import '../mainScreens/cartScreen.dart';
import 'package:badges/badges.dart';
import '../widgets/animatedList.dart';
import '../mainScreens/searchScreen.dart';

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
    Provider.of<Cart>(context, listen: false).fetchData();
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
                color: Color(0xffF0F4F9),
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
                    color: Color(0xffF0F4F9),
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
                  ? Tab(icon: new Image.asset('assets/icons/cart.png'))
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
                      child:
                          Tab(icon: new Image.asset('assets/icons/cart.png')),
                    ),
              onPressed: () => _goToCart(context),
            ),
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.30,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _select(index),
                  child: SubCategorySelector(
                    title: 'Accessories',
                    selected: _selected,
                    index: index,
                  ),
                );
              },
            ),
          ),
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
      ),
    );
  }
}
