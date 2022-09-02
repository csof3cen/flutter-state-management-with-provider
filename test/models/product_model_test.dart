import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_with_provider/models/product_model.dart';

void main() {
  group("Product Model Test", () {
    test("Checking add new product to selection works", () {
      var productIndex = 3;
      var product = Product.availableProducts[productIndex];

      Product().selectItem(productIndex);
      expect(Product.selectedProducts.contains(product), true);
    });

    test("Checking remove product to selection works", () {
      var productIndex = 3;
      var product = Product.availableProducts[productIndex];

      product.selectItem(productIndex);
      expect(product.getSelectedProducts.contains(product), true);
      product.unSelectItem(productIndex);
      expect(Product.selectedProducts.contains(product), false);
    });

    test("Checking removing all products works", () {
      Product().selectItem(2);
      Product().selectItem(3);
      Product().selectItem(4);
      Product().selectItem(5);
      Product().selectItem(1);
      expect(Product.selectedProducts.length == 5, true);
      Product().unSelectAllItems();
      expect(Product.selectedProducts.isEmpty, true);
    });
  });
}
