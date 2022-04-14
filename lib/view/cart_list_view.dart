import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/view_model/cart_view_model.dart';
import 'package:shopping_cart/widgets/product_card.dart';
import 'package:shopping_cart/widgets/product_list.dart';

class CartListView extends StatefulWidget {
  const CartListView({Key? key}) : super(key: key);

  static const route = "/cart";

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> cartProducts =
        context.watch<CartViewModel>().cartProducts;

    void removeFromCart(ProductModel product) {
      context.read<CartViewModel>().removeProduct(product);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: ProductList(
        products: cartProducts,
        builder: (index) {
          return ProductCard(
            product: cartProducts[index],
            iconButton: IconButton(
              onPressed: () {
                removeFromCart(cartProducts[index]);
              },
              icon: const Icon(Icons.close),
              color: Theme.of(context).colorScheme.error,
            ),
          );
        },
      ),
    );
  }
}
