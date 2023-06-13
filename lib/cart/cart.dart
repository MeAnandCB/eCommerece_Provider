import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:mechine_test_sample/ModelClass/Product_model.dart';

class Cart with ChangeNotifier {
  final Box<Product> _cartBox = Hive.box<Product>('cart');

  List<Product> get items => _cartBox.values.toList();

  void addToCart(Product product) {
    _cartBox.put(product.id, product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartBox.delete(product.id);
    notifyListeners();
  }

  void clearCart() {
    _cartBox.clear();
    notifyListeners();
  }
}
