import 'dart:convert';
import 'package:http/http.dart' as http;

Future<LoginData> login(String username, String password) async {
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
    if(response.statusCode == 403){
      print('403 Error');
    }else if(response.statusCode == 200){
      print('Response from Login: ${response.body}');
    }
    return LoginData.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw Exception('ERROR $e');
  }
}

Future<LoginData> register(String username, String password, String email) async {
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
    if(response.statusCode == 403){
      print('403 Error');
    }else if(response.statusCode == 200){
      print('Response from Registration: ${response.body}');
    }
    return LoginData.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw Exception('ERROR $e');
  }
}

class LoginData {
  String? token;

  LoginData({this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
