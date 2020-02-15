import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/cartItemModel.dart';

class WishList with ChangeNotifier {
  List<CartItemModel> _wishList = [];

  List<CartItemModel> get wishList {
    return [..._wishList];
  }

  //---------------------Add to SharedPreferences-------------------------------
  Future<void> addItemToWishList(CartItemModel newItem) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('wishListItems')) {
      final userData = json.encode(
        {
          'data': _wishList,
        },
      );
      prefs.setString('wishListItems', userData);
    }
    final responseData =
        json.decode(prefs.getString('wishListItems')) as Map<String, dynamic>;
    final List<CartItemModel> loadedItems = [];
    responseData['data'].forEach((itemData) {
      loadedItems.add(CartItemModel(
        id: itemData['id'],
        name: itemData['name'],
        image: itemData['image'],
        amount: itemData['amount'],
        price: itemData['price'],
      ));
    });
    _wishList = loadedItems;
    int index = _wishList.indexWhere((i) => i.id == newItem.id);
    index != -1
        ? _wishList[index].amount = 1
        : _wishList.add(
            CartItemModel(
              id: newItem.id,
              image: newItem.image,
              amount: newItem.amount,
              name: newItem.name,
              price: newItem.price,
            ),
          );
    final userData = json.encode(
      {
        'data': _wishList,
      },
    );
    prefs.setString('wishListItems', userData);
    notifyListeners();
  }

  //---------------------Fetch data from SharedPreferences----------------------
  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('wishListItems')) {
      return null;
    }
    final responseData =
        json.decode(prefs.getString('wishListItems')) as Map<String, dynamic>;
    final List<CartItemModel> loadedItems = [];
    responseData['data'].forEach((itemData) {
      loadedItems.add(CartItemModel(
        id: itemData['id'],
        name: itemData['name'],
        image: itemData['image'],
        amount: itemData['amount'],
        price: itemData['price'],
      ));
    });
    _wishList = loadedItems;
    notifyListeners();
    return _wishList;
  }

  //-----------------------Remove item from wishList----------------------------
  Future<void> removeItem(int i) async {
    try {
      _wishList.removeAt(i);
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('wishListItems')) {
        return null;
      }
      final userData = json.encode(
        {
          'data': _wishList,
        },
      );
      prefs.setString('wishListItems', userData);
      final responseData =
          json.decode(prefs.getString('wishListItems')) as Map<String, dynamic>;
      final List<CartItemModel> loadedItems = [];
      responseData['data'].forEach((itemData) {
        loadedItems.add(CartItemModel(
          id: itemData['id'],
          name: itemData['name'],
          image: itemData['image'],
          amount: itemData['amount'],
          price: itemData['price'],
        ));
      });
      _wishList = loadedItems;
      notifyListeners();
    } catch (error) {
      print('::::::::::::' + error.toString());
    }
  }

  //-----------------------------Empty wishList---------------------------------
  Future<void> emptyWishList() async {
    _wishList = [];
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('wishListItems')) {
      return null;
    }
    final userData = json.encode(
      {
        'data': _wishList,
      },
    );
    prefs.setString('wishListItems', userData);
    notifyListeners();
  }
}
