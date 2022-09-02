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
  group("HomeScreen Tests", () {
    testWidgets('Checking product list is shown', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets("Checking can add and remove product", (tester) async {
      // Can add
      await tester.pumpWidget(createHomeScreen());
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();
      expect(find.text(Product.availableProducts[0].name), findsNWidgets(2));
      // Can remove
      expect(find.byIcon(Icons.remove), findsOneWidget);
      await tester.tap(find.byIcon(Icons.remove).first);
      await tester.pumpAndSettle();
      expect(find.text(Product.availableProducts[0].name), findsOneWidget);
    });
  });
}
