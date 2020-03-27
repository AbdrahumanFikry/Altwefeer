import 'package:flutter/material.dart';
import 'package:infinity/models/categories.dart';
import 'package:infinity/models/singleCategory.dart';
import '../models/httpExceptionModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesProvider with ChangeNotifier {
  Categories categories;
  SingleCategory singleCategory;
  List<Type> subCategories = [];

  //---------------------------- Fetch Categories ------------------------------
  Future<void> fetchCategories() async {
    const url = 'https://hearts2020.com/eco/api/v1/category';
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        categories = Categories.fromJson(responseData);
        notifyListeners();
      } else {
        throw HttpException(message: responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  //------------------------- Fetch Single Category ----------------------------
  Future<void> fetchSingleCategory({int id}) async {
    final url = 'https://hearts2020.com/eco/api/v1/category/$id';
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
//        print('::::::::::::::::::: ' + responseData.toString());
        singleCategory = SingleCategory.fromJson(responseData);
        subCategories = singleCategory.data.type;

        notifyListeners();
      } else {
        throw HttpException(message: responseData['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
