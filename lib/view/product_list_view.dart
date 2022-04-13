import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/product_model.dart';
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
          bool isLoading = context
              .select<ProductViewModel, bool>((value) => value.isLoading);
          return isLoading ? _buildSpinner() : _buildProductList(context);
        },
      ),
    );
  }

  ListView _buildProductList(BuildContext context) {
    List<ProductModel> products = context.watch<ProductViewModel>().products;

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(product: products[index]);
      },
    );
  }

  ListTile _buildProductCard({required ProductModel product}) {
    return ListTile(
      title: Text(product.title!),
      leading: Image.network(
        product.image!,
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
      trailing: Text(product.price!.toString()),
    );
  }

  Center _buildSpinner() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
