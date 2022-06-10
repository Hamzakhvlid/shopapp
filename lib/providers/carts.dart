import 'dart:async';

import 'package:flutter/foundation.dart';

class CartItem {
  late String id;
  late String title;
  late int quantity;
  late double price;

  CartItem(
      {this.id = "", this.title = "", this.price = 0.0, this.quantity = 0});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price;
    });
    return total;
  }

  void removeItem(ID) {
    _items.removeWhere((key, value) => ID == value.title);
    notifyListeners();
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //update quantity

      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              price: value.price,
              quantity: value.quantity + 1,
              title: value.title));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                price: price,
                title: title,
                quantity: 1,
              ));
    }

    notifyListeners();
  }
}
