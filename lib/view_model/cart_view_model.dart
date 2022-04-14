import 'package:flutter/material.dart';
import 'package:shopping_cart/model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<ProductModel> cartProducts = [];

  int get totalCount => cartProducts.length;

  addProduct(ProductModel product) {
    cartProducts.add(product);
    notifyListeners();
  }

  removeProduct(ProductModel product) {
    cartProducts.remove(product);
    notifyListeners();
  }
}
