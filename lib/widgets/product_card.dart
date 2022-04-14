import 'package:flutter/material.dart';
import 'package:shopping_cart/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.iconButton})
      : super(key: key);

  final ProductModel product;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 12,
        ),
        title: Text(
          product.title!,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Image.network(
          product.image!,
          width: 75,
          height: 75,
          fit: BoxFit.contain,
        ),
        trailing: Column(
          children: [
            Flexible(
              flex: 2,
              child: iconButton,
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                "\$${product.price!.toString()}",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
