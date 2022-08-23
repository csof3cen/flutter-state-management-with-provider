import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  ProductModel({
    required this.name,
    required this.price,
  });

  ProductModel.empty({
    this.name = "Unavailable",
    this.price = 0,
  });

  final String name;
  final double price;

  static List<ProductModel> selectedProducts = [];

  List<ProductModel> get getSelectedProducts => selectedProducts;

  static List<ProductModel> availableProducts = [
    ProductModel(name: "T-Shirt", price: 200),
    ProductModel(name: "Mouse", price: 100),
    ProductModel(name: "Keyboard", price: 150),
    ProductModel(name: "Macbook Pro", price: 1000),
    ProductModel(name: "iPhone 13 Pro", price: 1200),
    ProductModel(name: "Airpods A10", price: 50),
  ];

  void selectItem(int id) {
    selectedProducts.add(availableProducts[id]);
    notifyListeners();
  }

  void removeItem(int id) {
    selectedProducts.remove(availableProducts[id]);
    notifyListeners();
  }

  void removeAllProducts() {
    selectedProducts.clear();
    notifyListeners();
  }
}
