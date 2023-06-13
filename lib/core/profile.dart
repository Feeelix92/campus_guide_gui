import 'dart:convert';
import 'package:campus_guide_gui/model/profile_data.dart';
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

  Future<void> createProfile(
      String firstname, String lastname, String email, String phone) async {
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
            'Authorization': 'Bearer $bearerToken'
          },
          body: jsonEncode(<String, String>{
            "id": "1",
            "image": "string",
            "firstname": firstname,
            "lastname": lastname,
            "email": email,
            "phone": phone
          }));

      if (response.statusCode == 200) {
        print('Response from Registration: ${response.body}');
      } else if (response.statusCode == 403) {
        print('403 Error');
      } else {
        print('mies ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
  }

  Future<ProfileData?> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9005';
    var url = '$baseURL/api/v1/profile';
    var bearerToken = token!;
    print(token);

    try {
      var response = await http.get(Uri.parse(url), headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken'
      });
      if (response.statusCode == 200) {
        print('Response from Registration: ${response.body}');
        return ProfileData.fromJSON(jsonDecode(response.body));
      } else if (response.statusCode == 403) {
        print('403 Error');
      } else {
        print('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
    return null;
  }

  Future<void> editProfileData(
      String firstname, String lastname, String email, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9005';
    var url = '$baseURL/api/v1/profile';
    var bearerToken = token!;
    print(token);

    try {
      var response = await http.put(Uri.parse(url),
          headers: <String, String>{
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer $bearerToken'
          },
          body: jsonEncode(<String, String>{
            "id": "1",
            "image": "string",
            "firstname": firstname,
            "lastname": lastname,
            "email": email,
            "phone": phone
          }));

      if (response.statusCode == 200) {
        print('Response from Update: ${response.body}');
      } else if (response.statusCode == 403) {
        print('403 Error');
      } else {
        print('mies ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
  }
}
