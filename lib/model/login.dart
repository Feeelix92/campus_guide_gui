import 'dart:convert';
import 'package:http/http.dart' as http;

Future<User> login(String username, String password) async {
  var baseURL = 'http://localhost:8080';
  var url = '$baseURL/api/v1/auth/authenticate';
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'passsword': password,
      'username': username,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to login.');
  }
}

Future<http.Response> postRequest3(String username, String password) {
  var baseURL = 'http://localhost:8080';
  var url = '$baseURL/api/v1/auth/authenticate';

  return http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'passsword': password,
      'username': username,
    }),
  );
}

class User {
  final String username;
  final String password;

  const User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
    );
  }
}