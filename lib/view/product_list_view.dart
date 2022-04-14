import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/view/cart_list_view.dart';
import 'package:shopping_cart/view_model/cart_view_model.dart';
import 'package:shopping_cart/view_model/product_view_model.dart';

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
            Positioned(
              top: 1,
              right: 6,
              child: Consumer(
                builder: (context, value, child) {
                  int totalCount = context
                      .select<CartViewModel, int>((value) => value.totalCount);

                  return Text(
                    totalCount.toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  );
                },
              ),
            )
          ],
        )
      ],
    );
  }

  ListView _buildProductList() {
    List<ProductModel> products = context.read<ProductViewModel>().products;

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _buildProductCard(product: products[index]),
            const SizedBox(
              height: 24,
            )
          ],
        );
      },
    );
  }

  Card _buildProductCard({required ProductModel product}) {
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
              child: IconButton(
                onPressed: () {
                  context.read<CartViewModel>().addProduct(product);
                },
                icon: const Icon(Icons.shopping_basket),
                color: Theme.of(context).colorScheme.primary,
              ),
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

  Center _buildSpinner() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
