import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;


class AuthService {
  String baseUrl = 'http://shamo-backend.test/api';

// REGISTER
  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

  var response = await http.post(
    Uri.parse(url),
    headers: header,
    body: body
    );


    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
       
      return user;
    }else {
      throw Exception("gagal register");
    }
  }

// LOGIN
Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

  var response = await http.post(
    Uri.parse(url),
    headers: header,
    body: body
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
       
      return user;
    }else {
      throw Exception("gagal login");
    }
  }
}
