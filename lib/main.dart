import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/app_theme.dart';
import 'package:shopping_cart/view/cart_list_view.dart';
import 'package:shopping_cart/view/product_list_view.dart';
import 'package:shopping_cart/view_model/cart_view_model.dart';
import 'package:shopping_cart/view_model/product_view_model.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductViewModel()),
        ChangeNotifierProvider(create: (context) => CartViewModel())
      ],
      child: MaterialApp(
        title: "Shopping Cart",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: ProductListView.route,
        routes: {
          ProductListView.route: (context) => const ProductListView(),
          CartListView.route: (context) => const CartListView()
        },
      ),
    );
  }
}
