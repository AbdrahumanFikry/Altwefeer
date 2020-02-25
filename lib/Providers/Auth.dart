import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/httpExceptionModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;

  bool get isAuth {
    return _token != null;
  }

  //------------------------------ Register ------------------------------------
  Future<void> register({String email, String password}) async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/oauth/register';
    try {
      var body = {
        'password': password,
        'name': 'AppUser',
        'password_confirmation': password,
        'email': email,
      };

      Map<String, String> headers = {
        'Accept': 'application/json',
      };
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        notifyListeners();
        throw HttpException(message: 'Done');
      } else {
        throw HttpException(
            message: responseData['error']['fields']['email'][0]);
      }
    } catch (error) {
      throw error;
    }
  }

  //-------------------------------- LogIn -------------------------------------
  Future<void> logIn({String email, String password}) async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/oauth/login';
    try {
      var body = {
        'email': email,
        'password': password,
      };

      Map<String, String> headers = {
        'Accept': 'application/json',
//        'Authorization': 'Bearer $_token',
      };
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (responseData.containsKey('error')) {
          throw HttpException(message: responseData['error']['message']);
        } else {
          //TODO -------------
          final prefs = await SharedPreferences.getInstance();
          final userData = {
            'token': _token,
            'userId': _userId,
          };
          prefs.setString('userData', json.encode(userData));
          notifyListeners();
        }
      } else {
        throw HttpException(message: responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  //------------------------------ AutoLogin -----------------------------------
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    notifyListeners();
    return true;
  }

  //------------------------------- LogOut -------------------------------------
  Future<void> logout() async {
    _token = null;
    _userId = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    notifyListeners();
    const url = 'https://erada-soft.com/Infinity/public/api/v1/logout';
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      };
      final response = await http.post(
        url,
        headers: headers,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (responseData.containsKey('error')) {
          throw HttpException(message: responseData['error']['message']);
        } else {
          throw HttpException(message: 'Done');
        }
      } else {
        throw HttpException(message: responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
