import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProviders with ChangeNotifier{

  late UserModel _user;

  // ADD GETTER
  UserModel get user => _user;

  // SETTER
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // REGISTER
  Future<bool> register ({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    // TRY CATCH FOR REGISTER SUCCES OR NOT
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password
      );
      // IF SUCCES
      _user = user;
      return true;
    } catch(e) {
      // IF ERROR
      print(e);
      return false;
    }
  }

  // LOGIN
  Future<bool> login ({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    // TRY CATCH FOR REGISTER SUCCES OR NOT
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password
      );
      // IF SUCCES
      _user = user;
      return true;
    } catch(e) {
      // IF ERROR
      print(e);
      return false;
    }
  }

}