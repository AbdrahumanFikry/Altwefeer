import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/cartItemModel.dart';
import 'dart:async';

class WishList with ChangeNotifier {
  List<CartItemModel> _wishList = [];
  List<CartItemModel> _deletedItems = [];

  List<CartItemModel> get wishList {
    return [..._wishList];
  }

  List<CartItemModel> get deletedItems {
    return [..._deletedItems];
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
  Future<void> removeItem(CartItemModel item) async {
    try {
      _deletedItems.add(item);
      int index = _wishList.indexWhere((i) => item.id == i.id);
      _wishList.removeAt(index);
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
    _deletedItems = [];
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

  //------------------------------- Undo All -----------------------------------
  void undoAll() {
    _deletedItems.forEach((item) {
      addItemToWishList(item);
    });
    _deletedItems = [];
    notifyListeners();
  }

  //----------------------------- clearCache -----------------------------------
  void clearCache() {
    _deletedItems = [];
    notifyListeners();
  }
}
