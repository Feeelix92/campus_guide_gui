import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postRequest(String username, String password) {
  var baseURL = 'http://localhost:8080';
  var url = '$baseURL/api/v1/auth/authenticate';
  var body = json.encode({
    'password': password,
    'username': username,
  });
  print('Body: $body');

  return http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body,
  );
}

Future<Map<String, dynamic>> postRequest2(String username, String password) async {
  var baseURL = 'http://localhost:8080';
  var url = '$baseURL/api/v1/auth/authenticate';
  var body = json.encode({
    'password': password,
    'username': username,
  });

  print('Body: $body');

  var response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body,
  );

  // todo - handle non-200 status code, etc

  return json.decode(response.body);
}