import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile with ChangeNotifier {
  String? token;

  /*bool get isAuth {
    authToken;
    return token != null;
  }

  get authToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }*/

  Future<void> createProfile(String firstname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9005';
    var url = '$baseURL/api/v1/profile';
    var bearerToken = token!;

    print(token);

    try {
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'bearer': bearerToken
          },
          body: jsonEncode(<String, String>{
            "id": "5",
            "image": "string",
            "firstname": firstname,
            "lastname": "string3",
            "email": "string",
            "phone": "+47 4 1 303 2"
      }));

      if(response.statusCode == 200) {
        print('Response from Registration: ${response.body}');
      } else if (response.statusCode == 403) {
        print('403 Error');
      } else{
        print('mies ${response.statusCode}');
      }
    }  catch (e) {
      throw Exception('ERROR $e');
    }
  }
}