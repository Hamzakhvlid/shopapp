import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite ;

  Product({
    this.id = "",
    this.title = "",
    this.description = "",
    this.price = 0,
    this.imageUrl = "",
    this.isFavorite=false,
  });

  void toggleButton() {
    isFavorite = !isFavorite;
    
    
     notifyListeners();
    
    
  }
}
