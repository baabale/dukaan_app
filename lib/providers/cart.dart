import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> items = [];
  bool isLoading = true;

  void addToCart(ProductModel item) {
    if (!items.contains(item)) {
      items.add(item);
      notifyListeners();
    }
  }

  void removeFromCart(ProductModel item) {
    if (items.contains(item)) {
      items.remove(item);
      notifyListeners();
    }
  }

  bool isInCart(ProductModel product) => items.contains(product);
}
