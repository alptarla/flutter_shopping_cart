import 'package:flutter/material.dart';
import 'package:shopping_cart/model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<ProductModel> cartProducts = [];

  int get totalCount => cartProducts.length;

  bool isContains(ProductModel product) => cartProducts.contains(product);

  addProduct(ProductModel product) {
    if (isContains(product)) return;

    cartProducts.add(product);
    notifyListeners();
  }

  removeProduct(ProductModel product) {
    if (!isContains(product)) return;

    cartProducts.remove(product);
    notifyListeners();
  }
}
