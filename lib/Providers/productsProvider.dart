import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinity/models/HomeProducts.dart';
import 'package:infinity/models/singleProduct.dart';
import 'dart:convert';
import '../models/httpExceptionModel.dart';

class ProductsProvider with ChangeNotifier {
  String token;
  Products products;
  SingleProduct singleProduct;
  List<String> searchItems = [];

  ProductsProvider({
    this.token,
  });

  //---------------------------- Fetch Products --------------------------------
  Future<void> fetchProducts() async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/home';
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'X-lang': 'en',
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        products = Products.fromJson(responseData);
        products.sections.forEach(
          (section) {
            section.src.forEach(
              (product) {
                searchItems.add(product.name);
              },
            );
          },
        );
        notifyListeners();
      } else {
        throw HttpException(message: responseData['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  //------------------------- Fetch Single Product -----------------------------
  Future<void> fetchSingleProducts({@required int id}) async {
    final url = 'https://erada-soft.com/Infinity/public/api/v1/product/$id';
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'X-lang': 'en',
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
//        print('::::::::::::::::' + responseData.toString());
        singleProduct = SingleProduct.fromJson(responseData);
        notifyListeners();
      } else {
        throw HttpException(message: responseData['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  //------------------------- Fetch Single Category ----------------------------
  Future<void> fetchSingleCategory({int id}) async {
    final url = 'https://erada-soft.com/Infinity/public/api/v1/category/$id';
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'X-lang': 'en',
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        singleProduct = SingleProduct.fromJson(responseData);
        notifyListeners();
      } else {
        throw HttpException(message: responseData['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
