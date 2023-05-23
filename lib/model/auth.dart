import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> login(String username, String password) async {
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
    print('${response.body} Response from Login');
    return response.body;
  } catch (e) {
    return 'ERROR $e';
  }
}

Future<String> register(String username, String password, String email) async {
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
    print('${response.body} Response from Registration');
    return response.body;
  } catch (e) {
    return 'ERROR $e';
  }
}