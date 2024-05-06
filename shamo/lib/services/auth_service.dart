import 'package:shamo/models/user_model.dart';
import 'package:http'

class AuthService {
  String baseUrl = 'http://shamo-backend.test/api';

  Future<UserModel> register({
    String name, 
    String username, 
    String email, 
    String password
  }) async {
    var url = '$baseUrl/register';
    var header = {'Content-type': 'application/json'};
    var body = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
    // Lanjutkan dengan implementasi logika untuk melakukan registrasi
  }
}
