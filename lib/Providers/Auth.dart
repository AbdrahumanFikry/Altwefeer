import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinity/models/userData.dart';
import 'dart:convert';
import '../models/httpExceptionModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  UserData userData;

  bool get isAuth {
    return _token != null;
  }

  //------------------------------ Register ------------------------------------
  Future<void> register({String email, String password}) async {
    String userName = email.split('@')[0];
    const url = 'https://erada-soft.com/Infinity/public/api/v1/oauth/register';
    try {
      var body = {
        'password': password,
        'name': userName,
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
          _token = responseData['token'];
          final prefs = await SharedPreferences.getInstance();
          final userData = {
            'token': _token,
          };
          prefs.setString('userData', json.encode(userData));
          notifyListeners();
          return true;
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
    notifyListeners();
    return true;
  }

  //------------------------------- LogOut -------------------------------------
  Future<void> logout() async {
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
          _token = null;
          final prefs = await SharedPreferences.getInstance();
          prefs.remove('userData');
          notifyListeners();
          return true;
        }
      } else {
        throw HttpException(message: responseData['error']['message']);
      }
    } catch (error) {
      _token = null;
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('userData');
      notifyListeners();
    }
  }

  //------------------------------ User Data -----------------------------------
  Future<void> fetchUserData() async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/user';
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        userData = UserData.fromJson(responseData);
        print('::::::' + userData.email);
        notifyListeners();
      } else {
        throw HttpException(
            message: responseData['error']['fields']['email'][0]);
      }
    } catch (error) {
      throw error;
    }
  }

  //--------------------------- Update User Data -------------------------------
  Future<void> updateUserData(
      {String email, String password, String name}) async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/profile';
    try {
      var body = {
        'name': name,
        'password': password,
        'email': email,
      };

      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('::::::::::::::' + responseData.toString());
        fetchUserData();
        notifyListeners();
      } else {
        throw HttpException(message: responseData['error']['fields']['email']);
      }
    } catch (error) {
      throw error;
    }
  }

  //-------------------------- Deactivate Account ------------------------------
  Future<void> deactivateAccount() async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/deactivate';
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
        _token = null;
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('userData');
        notifyListeners();
        return true;
      } else {
        throw HttpException(message: responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  //---------------------------- Forgot Password -------------------------------
  Future<void> forgotPassword({@required String email}) async {
    const url = 'https://erada-soft.com/Infinity/public/api/v1/password/create';
    try {
      var body = {
        'email': email,
      };
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      final Map responseData = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        notifyListeners();
        return true;
      } else {
        throw HttpException(message: responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

//----------------------------- Resend Verify --------------------------------
//  Future<void> resendVerify({@required String email}) async {
//    const url =
//        'https://erada-soft.com/Infinity/public/api/v1/oauth/email/resend';
//    try {
//      var body = {
//        'email': email,
//      };
//      Map<String, String> headers = {
//        'Accept': 'application/json',
//        'Content-Type': 'application/x-www-form-urlencoded',
//      };
//      final response = await http.post(
//        url,
//        headers: headers,
//        body: body,
//      );
//      final Map responseData = json.decode(response.body);
//      if (response.statusCode >= 200 && response.statusCode < 300) {
//        notifyListeners();
//        throw HttpException(message: responseData['message']);
//      } else {
//        throw HttpException(message: responseData['error']['message']);
//      }
//    } catch (error) {
//      throw error;
//    }
//  }
}
