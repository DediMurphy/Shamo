import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';

class WistlistProviders with ChangeNotifier {
  
  List<ProductModel> _wishlist = [];

  //GETTER
  List<ProductModel> get wistlist => _wishlist;

  // SETTER
  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isWishList(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == element.id);
    }

    notifyListeners();
  }

  isWishList(ProductModel product) {
    if (_wishlist.indexWhere((element) => element.id == element.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

}