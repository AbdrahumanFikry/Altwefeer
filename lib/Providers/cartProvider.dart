import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/cartItemModel.dart';

class Cart with ChangeNotifier {
  List<CartItemModel> _cartList = [];

  List<CartItemModel> get cartList {
    return [..._cartList];
  }

  //---------------------Add to SharedPreferences-------------------------------
  Future<void> addItemToCart(CartItemModel newItem) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('cartItems')) {
      final userData = json.encode(
        {
          'data': _cartList,
        },
      );
      prefs.setString('cartItems', userData);
    }
    final responseData =
        json.decode(prefs.getString('cartItems')) as Map<String, dynamic>;
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
    _cartList = loadedItems;
    int index = _cartList.indexWhere((i) => i.id == newItem.id);
    index != -1
        ? _cartList[index].amount += 1
        : _cartList.add(
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
        'data': _cartList,
      },
    );
    prefs.setString('cartItems', userData);
    returnTotal();
    notifyListeners();
  }

  //---------------------Fetch data from SharedPreferences----------------------
  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('cartItems')) {
      return null;
    }
    final responseData =
        json.decode(prefs.getString('cartItems')) as Map<String, dynamic>;
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
    _cartList = loadedItems;
    returnTotal();
    notifyListeners();
    return _cartList;
  }

  //--------------------------Remove amount from cart---------------------------
  Future<void> removeAmount(int id) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('cartItems')) {
      return null;
    }
    final responseData =
        json.decode(prefs.getString('cartItems')) as Map<String, dynamic>;
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
    _cartList = loadedItems;
    int index = _cartList.indexWhere((item) => item.id == id);
    _cartList[index].amount > 1
        ? _cartList[index].amount = _cartList[index].amount - 1
        : _cartList.removeAt(index);
    final userData = json.encode(
      {
        'data': _cartList,
      },
    );
    prefs.setString('cartItems', userData);
    returnTotal();
    notifyListeners();
  }

  //--------------------------Remove item from cart-----------------------------
  Future<void> removeItem(int i) async {
    try {
      _cartList.removeAt(i);
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('cartItems')) {
        return null;
      }
      final userData = json.encode(
        {
          'data': _cartList,
        },
      );
      prefs.setString('cartItems', userData);
      final responseData =
          json.decode(prefs.getString('cartItems')) as Map<String, dynamic>;
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
      _cartList = loadedItems;
      returnTotal();
      notifyListeners();
    } catch (error) {
      print('::::::::::::' + error.toString());
    }
  }

  //-------------------------------Total cart-----------------------------------
  double returnTotal() {
    double sum = 0;
    _cartList.forEach((item) {
      sum = sum + (item.price * item.amount);
    });
    return sum;
  }

  //------------------------------ AllPrice ------------------------------------
  double returnAllPrice(CartItemModel item) {
    double total = 0;
    final index = _cartList.indexWhere((i) => i.id == item.id);
    if (index == -1) {
      return null;
    }
    total = _cartList[index].price * _cartList[index].amount;
    return total;
  }

  //-------------------------------Empty cart-----------------------------------
  Future<void> emptyCart() async {
    _cartList = [];
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('cartItems')) {
      return null;
    }
    final userData = json.encode(
      {
        'data': _cartList,
      },
    );
    prefs.setString('cartItems', userData);
    notifyListeners();
  }
}
