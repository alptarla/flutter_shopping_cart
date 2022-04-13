import 'package:flutter/material.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/service/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> products = [];
  ProductModel? product;
  bool isLoading = false;

  final ProductService _productService = ProductService();

  ProductViewModel() {
    fetchProducts();
  }

  void toggleLoading() {
    isLoading = !isLoading;
  }

  Future<void> fetchProducts() async {
    toggleLoading();
    products = await _productService.fetchProducts();
    toggleLoading();

    notifyListeners();
  }

  void fetchProductById(int id) {}
}
