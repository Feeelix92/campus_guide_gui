import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_data.dart';

class Auth with ChangeNotifier {
  String? token;

  bool get isAuth {
    authToken;
    return token != null;
  }

  get authToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.setBool('isAuth', false);
    token = null;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    var baseURL = 'http://localhost:8080';
    var url = '$baseURL/api/v1/auth/authenticate';
    print(url);
    try {
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            "username": username,
            "password": password,
          }));
      if (response.statusCode == 403) {
        print('403 Error');
      } else if (response.statusCode == 200) {
        print('Response from Login: ${response.body}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        token = LoginData
            .fromJson(jsonDecode(response.body))
            .token;
        if (isAuth) {
          prefs.setString('token', token!);
          prefs.setBool('isAuth', isAuth);
        }
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
    notifyListeners();
  }

  Future<void> register(String username, String password, String email) async {
    var baseURL = 'http://localhost:8080';
    var url = '$baseURL/api/v1/auth/register';
    print(url);
    try {
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            "username": username,
            "email": email,
            "password": password,
          }));
      if (response.statusCode == 403) {
        print('403 Error');
      } else if (response.statusCode == 200) {
        print('Response from Registration: ${response.body}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        token = LoginData
            .fromJson(jsonDecode(response.body))
            .token;
        if (isAuth) {
          prefs.setString('token', token!);
          prefs.setBool('isAuth', isAuth);
        }
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
    notifyListeners();
  }
}
