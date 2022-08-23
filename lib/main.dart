import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/product_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProductModel>(
      create: (context) => ProductModel.empty(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter States"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[200],
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.check), label: "Checkout"),
          ],
        ),
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
      ),
    );
  }
}

class SelectedItems extends StatelessWidget {
  const SelectedItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: MediaQuery.of(context).size.width - 20,
      child: Consumer<ProductModel>(
        builder: (context, value, child) {
          List<Widget> selectedItems = [];
          for (var product in ProductModel.selectedProducts) {
            selectedItems.add(
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                child: Text(
                  product.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
          return Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: selectedItems,
            ),
          );
        },
      ),
    );
  }
}
