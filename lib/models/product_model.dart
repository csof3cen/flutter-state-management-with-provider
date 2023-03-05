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
    Product(name: "MX Mouse", price: 100),
    Product(name: "Keyboard", price: 150),
    Product(name: "Macbook Pro", price: 1000),
    Product(name: "iPhone 13 Pro", price: 1200),
    Product(name: "Airpods A10", price: 50),
    Product(name: 'Parfum XI', price: 25),
    // Product(name: 'Notebook', price: 10),
    // Product(name: 'Black Pencil', price: 5),
    // Product(name: '500 GB Disk', price: 75),
    // Product(name: 'Post-Its', price: 5),
    // Product(name: '3D Embellishment Art Lamp', price: 20),
    // Product(name: 'Flying Wooden Bird', price: 10),
    // Product(name: 'Gulab Powder 50 Gram', price: 30),
    // Product(name: 'Elbow Macaroni - 400 gm', price: 25),
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
