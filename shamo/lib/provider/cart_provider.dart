import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cart = [];

  // GETTER
  List<CartModel> get cart => _cart;

  // SETTER
  set carts(List<CartModel> cart) {
    _cart = cart;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index = _cart.indexWhere((element) => element.product?.id == product.id);
      _cart[index].quantity = (_cart[index].quantity ?? 0) + 1;
    } else {
      _cart.add(
        CartModel(
          id: _cart.length,
          product: product,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  removeCart(int id) {
    _cart.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  addQuantity(int id) {
    int index = _cart.indexWhere((item) => item.id == id);
    if (index != -1) {
      _cart[index].quantity = (_cart[index].quantity ?? 0) + 1;
    }
    notifyListeners();
  }

  reduceQuantity(int id) {
    int index = _cart.indexWhere((item) => item.id == id);
    if (index != -1) {
      _cart[index].quantity = (_cart[index].quantity ?? 0) - 1;
      if (_cart[index].quantity == 0) {
        _cart.removeAt(index);
      }
    }
    notifyListeners();
  }

  totalPrice() {
    double total = 0.0;
    for (var item in _cart) {
      total += (item.quantity! * (item.product?.price ?? 0));
    }
    return total;
  }

  productExist(ProductModel product) {
    return _cart.any((element) => element.product?.id == product.id);
  }
}
