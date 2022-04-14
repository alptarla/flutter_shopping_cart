import 'package:flutter/material.dart';
import 'package:shopping_cart/model/product_model.dart';

typedef BuilderCallback = Widget Function(int index);

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.products,
    required this.builder,
  }) : super(key: key);

  final List<ProductModel> products;
  final BuilderCallback builder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            builder(index),
            const SizedBox(
              height: 24,
            )
          ],
        );
      },
    );
  }
}
