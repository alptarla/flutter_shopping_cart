import 'package:flutter/material.dart';
import 'package:shopping_cart/core/app_theme.dart';
import 'package:shopping_cart/view/cart_list_view.dart';
import 'package:shopping_cart/view/product_list_view.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping Cart",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: ProductListView.route,
      routes: {
        ProductListView.route: (context) => const ProductListView(),
        CartListView.route: (context) => const CartListView()
      },
    );
  }
}
