import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mainScreens/categoriesScreen.dart';
import '../mainScreens/homeScreen.dart';
import '../mainScreens/profileScreen.dart';

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
            icon: Icon(
              Icons.home,
              size: 28,
              color: index != 0 ? Colors.black : Color(0xff008BFF),
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
            icon: Icon(
              Icons.library_books,
              size: 28,
              color: index != 1 ? Colors.black : Color(0xff008BFF),
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
            icon: Icon(
              Icons.perm_identity,
              size: 28,
              color: index != 2 ? Colors.black : Color(0xff008BFF),
            ),
            title: Text(
              "Profile",
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
