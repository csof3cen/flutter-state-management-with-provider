import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_with_provider/models/product_model.dart';
import 'package:state_management_with_provider/presentation/screens/home_screen/home_screen.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Product>(
      create: (context) => Product(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );

void main() {
  group("HomeScreen to Checkout Navigation Tests", () {
    testWidgets('Checking product list is shown', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets("Checking can add multiple products and total is correct",
        (tester) async {
      // Can add
      await tester.pumpWidget(createHomeScreen());
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();

      // Navigate
      await tester.tap(find.byIcon(Icons.payment));
      await tester.pumpAndSettle();

      // Have Total
      double total = 0;
      var i = 0;
      for (var element in Product.selectedProducts) {
        i++;
        if (i > 3) return;
        total += element.price;
      }

      expect(find.text("\$${total.toString()}"), findsOneWidget);
    });
  });
}
