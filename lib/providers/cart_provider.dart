import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  void addProduct(Map<String, dynamic> item) {
    cart.add(item);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> item) {
    cart.remove(item);
    notifyListeners();
  }
}
