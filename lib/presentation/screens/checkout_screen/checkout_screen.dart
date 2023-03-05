import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/product_model.dart';
import 'package:state_management_with_provider/presentation/screens/components/selected_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Consumer<Product>(builder: (context, Product product, child) {
        double totalPrice = 0;
        for (var element in Product.selectedProducts) {
          totalPrice += element.price;
        }
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Text(
                "\$$totalPrice",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SelectedItems(),
            const Spacer(),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 20,
                ),
                width: MediaQuery.of(context).size.width - 50,
                child: ElevatedButton(
                  onPressed: () {}, // Proceed to payment
                  child: const Text("Proceed to payment"),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
