import 'package:flutter/material.dart';
import 'package:infinity/models/categories.dart';
import '../models/httpExceptionModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesProvider with ChangeNotifier {
  Categories categories;

  //---------------------------- Fetch Categories ------------------------------
  Future<void> fetchCategories() async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/category';
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
        print(":::::::::::::" + responseData.toString());
        categories = Categories.fromJson(responseData);
        notifyListeners();
      } else {
        throw HttpException(message: responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
