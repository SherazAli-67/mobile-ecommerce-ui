import 'package:flutter/foundation.dart';
import 'package:mobile_ecommerce_ui/core/app_data.dart';
import 'package:mobile_ecommerce_ui/core/models/cart_item_model.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  CartProvider() : _items = List<CartItemModel>.from(AppData.cartItems);

  List<CartItemModel> _items;

  List<CartItemModel> get items => List.unmodifiable(_items);

  bool get hasItems => _items.isNotEmpty;

  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  double get itemsTotal => _items.fold(0, (sum, item) => sum + item.lineTotal);

  double get shippingFee => AppData.shippingFee;

  double get discount => AppData.discount;

  double get subTotal => itemsTotal + shippingFee - discount;

  void addProduct(ProductModel product, {int quantity = 1}) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      _items = [..._items, CartItemModel(id: 'c${product.id}', product: product, quantity: quantity)];
    } else {
      final existing = _items[index];
      _items = [..._items]..[index] = existing.copyWith(quantity: existing.quantity + quantity);
    }
    notifyListeners();
  }

  void increment(String cartItemId) {
    final index = _items.indexWhere((item) => item.id == cartItemId);
    if (index == -1) return;
    final existing = _items[index];
    _items = [..._items]..[index] = existing.copyWith(quantity: existing.quantity + 1);
    notifyListeners();
  }

  void decrement(String cartItemId) {
    final index = _items.indexWhere((item) => item.id == cartItemId);
    if (index == -1) return;
    final existing = _items[index];
    if (existing.quantity <= 1) {
      remove(cartItemId);
      return;
    }
    _items = [..._items]..[index] = existing.copyWith(quantity: existing.quantity - 1);
    notifyListeners();
  }

  void remove(String cartItemId) {
    _items = _items.where((item) => item.id != cartItemId).toList();
    notifyListeners();
  }
}
