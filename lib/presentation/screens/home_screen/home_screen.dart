import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/selected_items.dart';
import '../../components/bottom_navigation_bar.dart';
import 'package:state_management_with_provider/models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter States"),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: ProductModel.availableProducts.length,
            itemBuilder: ((context, index) {
              var currentProduct = ProductModel.availableProducts[index];
              return Consumer(
                builder: ((context, ProductModel product, child) {
                  return ListTile(
                    title: Text(currentProduct.name),
                    subtitle: Text(
                      "${currentProduct.price}\$",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (!ProductModel.selectedProducts
                            .contains(currentProduct)) {
                          product.selectItem(index);
                        } else {
                          product.removeItem(index);
                        }
                      },
                      icon: Icon(
                        ProductModel.selectedProducts.contains(currentProduct)
                            ? Icons.remove
                            : Icons.add,
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
          const SelectedItems(),
        ],
      ),
    );
  }
}
