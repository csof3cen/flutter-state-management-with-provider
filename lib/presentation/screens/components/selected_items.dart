import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/product_model.dart';

class SelectedItems extends StatelessWidget {
  const SelectedItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: MediaQuery.of(context).size.width - 20,
      child: Consumer<Product>(
        builder: (context, value, child) {
          List<Widget> selectedItems = [];
          for (var product in Product.selectedProducts) {
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
