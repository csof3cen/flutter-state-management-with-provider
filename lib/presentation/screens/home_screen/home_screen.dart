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
        centerTitle: true,
        title: const Text("Flutter Provider State Management"),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SelectedItems(),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: Product.availableProducts.length,
              itemBuilder: ((context, index) {
                var currentProduct = Product.availableProducts[index];
                return Consumer(
                  builder: ((context, Product product, child) {
                    return ListTile(
                      title: Text(currentProduct.name),
                      subtitle: Text(
                        "${currentProduct.price}\$",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if (!Product.selectedProducts.contains(currentProduct)) {
                            product.selectItem(index);
                          } else {
                            product.unSelectItem(index);
                          }
                        },
                        icon: Icon(
                          Product.selectedProducts.contains(currentProduct) ? Icons.remove : Icons.add,
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
