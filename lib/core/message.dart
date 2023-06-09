import 'dart:convert';
import 'package:campus_guide_gui/model/message_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Message with ChangeNotifier {
  String? token;
  String? username;

  Future<MessageData?> getMessageData(
  String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(id);

    var baseURL = 'http://localhost:9006';
    var url = '$baseURL/api/v1/messages/$id';
    var bearerToken = token!;
    print(url);
    try {
      var response = await http.get(Uri.parse(url), headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken'
      });
      if (response.statusCode == 200) {
        print('Response from Get: ${response.body}');
        return MessageData.fromJSON(jsonDecode(response.body));
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
        List<dynamic> l = json.decode(response.body);
        print('line 67 ${l}');
        List<MessageData> messages = List<MessageData>.from(l.map((model)=> MessageData.fromJSON(model as Map<String, dynamic>)));
        print('line 69 ${messages}');
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

  Future<void> postMessageData(String title, String text, String teaser, String author, List<dynamic> tags) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9006';
    var url = '$baseURL/api/v1/messages';
    var bearerToken = token!;

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
            "teaser": teaser,
            "author": author,
            "tags": tags
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
  Future<void> putMessageData(String id, String title, String text, String teaser, String author, List<dynamic> tags) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9006';
    var url = '$baseURL/api/v1/messages/$id';
    var bearerToken = token!;

    print(token);
    try {
      var headers = <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await http.put(Uri.parse(url),
          headers: headers,
          body: jsonEncode(<String, dynamic>{
            "title": title,
            "text": text,
            "teaser": teaser,
            "author": author,
            "tags": tags
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

  Future<void> deleteMessage(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var baseURL = 'http://localhost:9006';
    var url = '$baseURL/api/v1/messages/$id';
    var bearerToken = token!;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $bearerToken'},
      );

      if (response.statusCode == 204) {
        // Erfolgreich gelöscht
        print('Nachricht erfolgreich gelöscht');
      } else if (response.statusCode == 400) {
        // Benutzer nicht berechtigt
        print('Benutzer nicht berechtigt, die Nachricht zu löschen');
      } else if (response.statusCode == 404) {
        // Nachricht nicht gefunden
        print('Nachricht nicht gefunden');
      } else {
        // Unerwarteter Fehler
        print('Unerwarteter Fehler beim Löschen der Nachricht');
      }
    } catch (e) {
      // Fehler bei der Verbindung oder Anfrage
      print('Fehler beim Löschen der Nachricht: $e');
    }
  }

}
