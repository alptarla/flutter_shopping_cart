import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/view_model/product_view_model.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  static const String route = "/";

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, value, child) {
          bool isLoading = context.watch<ProductViewModel>().isLoading;
          return Center(
            child: Text(isLoading ? "loading" : "idle"),
          );
        },
      ),
    );
  }
}
