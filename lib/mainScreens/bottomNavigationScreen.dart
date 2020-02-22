import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mainScreens/categoriesScreen.dart';
import '../mainScreens/homeScreen.dart';
import '../mainScreens/profileScreen.dart';
import '../Providers/cartProvider.dart';
import '../Providers/wishListProvider.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  //-------------------------------variables----------------------------------
  int index = 0;
  List<Widget> _pages = [];

  //--------------------------------methods-----------------------------------
  @override
  void initState() {
    _pages = [
      HomeScreen(),
      CategoriesScreen(),
      ProfileScreen(),
    ];
    Provider.of<Cart>(context, listen: false).fetchData();
    Provider.of<WishList>(context, listen: false).fetchData();
    super.initState();
  }

  void _changeScreen(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: _changeScreen,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
            ),
            activeIcon: Image.asset(
              'assets/icons/homeActive.png',
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: index != 0 ? Colors.black : Color(0xff008BFF),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/category.png',
            ),
            activeIcon: Image.asset(
              'assets/icons/categoryActive.png',
            ),
            title: Text(
              "Categories",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: index != 1 ? Colors.black : Color(0xff008BFF),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/account.png',
            ),
            activeIcon: Image.asset(
              'assets/icons/accountActive.png',
            ),
            title: Text(
              "Account",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: index != 2 ? Colors.black : Color(0xff008BFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
