import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  double get subtotal {
    return _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  double get shipping => 0.0;
  double get grandTotal => subtotal + shipping;

  int get itemCount => _cartItems.length;

  void addToCart(CartItem item) {
    // Check if item already exists with same size and color
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) => 
        cartItem.name == item.name && 
        cartItem.size == item.size && 
        cartItem.color == item.color
    );

    if (existingItemIndex != -1) {
      // Update quantity of existing item
      _cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      // Add new item
      _cartItems.add(item);
    }
    
    notifyListeners();
  }

  void removeFromCart(String itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  void updateQuantity(String itemId, int quantity) {
    final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      if (quantity <= 0) {
        _cartItems.removeAt(itemIndex);
      } else {
        _cartItems[itemIndex].quantity = quantity;
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  bool isInCart(String name, String size, String color) {
    return _cartItems.any((item) => 
      item.name == name && 
      item.size == size && 
      item.color == color
    );
  }
}

