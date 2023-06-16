import 'dart:convert';
import 'package:campus_guide_gui/model/message_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Message with ChangeNotifier {
  String? token;

  Future<void> createMessage(
      String firstname, String lastname, String email, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9006';
    var url = '$baseURL/api/v1/messages';
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

  Future<List<MessageData>?> getMessagesData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9006';
    var url = '$baseURL/api/v1/messages/all';
    var bearerToken = token!;

    try {
      var response = await http.get(Uri.parse(url), headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken'
      });
      if (response.statusCode == 200) {
        print('Response from Get: ${response.body}');
        Iterable l = json.decode(response.body);
        List<MessageData> messages = List<MessageData>.from(l.map((model)=> MessageData.fromJSON(model)));
        return messages;
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

  Future<void> postMessageData(
      String title, String text, String author, String created, String lastChanged, List<String> tags) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9006';
    var url = '$baseURL/api/v1/messages';
    var bearerToken = token!;
    created = DateTime.now().toString();
    print(created) ;

    print(token);
    try {
      var headers = <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode(<String, dynamic>{
            "title": title,
            "text": text,
            "author": author,
            "created": created,
            "lastChanged": lastChanged,
            "tags": ["cool"]
          }));
      print(response);

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
