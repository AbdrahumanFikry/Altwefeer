import 'package:flutter/material.dart';

class CartItemModel with ChangeNotifier {
  int id;
  String name;
  String image;
  int amount;
  double price;

  CartItemModel({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.amount,
    @required this.price,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    amount = json['amount'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
