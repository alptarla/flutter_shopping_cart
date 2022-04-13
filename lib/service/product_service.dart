import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_cart/core/app_constants.dart';
import 'package:shopping_cart/model/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    http.Response res =
        await http.get(Uri.parse('${AppConstants.productApiUrl}/products'));

    if (res.statusCode == HttpStatus.ok) {
      final jsonData = jsonDecode(res.body);

      if (jsonData is List) {
        return jsonData.map((e) => ProductModel.fromJson(e)).toList();
      }
    }

    throw Exception("Failed to load products");
  }
}
