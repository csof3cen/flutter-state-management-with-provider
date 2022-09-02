import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  Product({
    this.name = "Unavailable",
    this.price = 0,
  });

  final String name;
  final double price;

  static List<Product> selectedProducts = [];

  List<Product> get getSelectedProducts => selectedProducts;

  static List<Product> availableProducts = [
    Product(name: "T-Shirt", price: 200),
    Product(name: "Mouse", price: 100),
    Product(name: "Keyboard", price: 150),
    Product(name: "Macbook Pro", price: 1000),
    Product(name: "iPhone 13 Pro", price: 1200),
    Product(name: "Airpods A10", price: 50),
  ];

  void selectItem(int id) {
    selectedProducts.add(availableProducts[id]);
    notifyListeners();
  }

  void unSelectItem(int id) {
    var productToRemove = availableProducts[id];
    selectedProducts.removeWhere((p) => p.hashCode == productToRemove.hashCode);
    notifyListeners();
  }

  void unSelectAllItems() {
    selectedProducts.clear();
    notifyListeners();
  }
}
