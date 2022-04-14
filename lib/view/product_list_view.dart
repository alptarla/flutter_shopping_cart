import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/view/cart_list_view.dart';
import 'package:shopping_cart/view_model/cart_view_model.dart';
import 'package:shopping_cart/view_model/product_view_model.dart';
import 'package:shopping_cart/widgets/product_card.dart';
import 'package:shopping_cart/widgets/product_list.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  static const String route = "/";

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final String _viewTitle = "Product List";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Consumer<ProductViewModel>(
        builder: (context, value, child) {
          bool isLoading = context
              .select<ProductViewModel, bool>((value) => value.isLoading);
          return isLoading ? _buildSpinner() : _buildProductList();
        },
      ),
    );
  }

  ProductList _buildProductList() {
    List<ProductModel> products = context.watch<ProductViewModel>().products;

    void addProductToCart(ProductModel product) =>
        context.read<CartViewModel>().addProduct(product);

    return ProductList(
        products: products,
        builder: (index) {
          return ProductCard(
            product: products[index],
            iconButton: IconButton(
              onPressed: () {
                addProductToCart(products[index]);
              },
              icon: const Icon(Icons.shopping_basket),
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_viewTitle),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartListView.route);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            _buildProductCountText()
          ],
        )
      ],
    );
  }

  Positioned _buildProductCountText() {
    return Positioned(
      top: 1,
      right: 6,
      child: Consumer(
        builder: (context, value, child) {
          int totalCount =
              context.select<CartViewModel, int>((value) => value.totalCount);

          return Text(
            totalCount.toString(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          );
        },
      ),
    );
  }

  Center _buildSpinner() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
