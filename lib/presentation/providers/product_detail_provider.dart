import 'package:flutter/material.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_data.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';

class ProductDetailProvider extends ChangeNotifier {
  ProductDetailProvider({required ProductModel product})
      : _product = product,
        _isFavorite = product.isFavorite,
        _selectedSize = AppData.sizes[2],
        _selectedColor = AppColors.grey11;

  ProductModel _product;
  int _quantity = 1;
  String _selectedSize;
  Color _selectedColor;
  bool _isFavorite;
  bool _isDescriptionExpanded = false;

  static const colors = [AppColors.grey4, AppColors.grey11, AppColors.grey10];

  ProductModel get product => _product;

  int get quantity => _quantity;

  String get selectedSize => _selectedSize;

  Color get selectedColor => _selectedColor;

  bool get isFavorite => _isFavorite;

  bool get isDescriptionExpanded => _isDescriptionExpanded;

  List<String> get sizes => AppData.sizes;

  double get linePrice => _product.price * _quantity;

  void increment() {
    _quantity += 1;
    notifyListeners();
  }

  void decrement() {
    if (_quantity <= 1) return;
    _quantity -= 1;
    notifyListeners();
  }

  void selectSize(String size) {
    if (_selectedSize == size) return;
    _selectedSize = size;
    notifyListeners();
  }

  void selectColor(Color color) {
    if (_selectedColor == color) return;
    _selectedColor = color;
    notifyListeners();
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    _product = _product.copyWith(isFavorite: _isFavorite);
    notifyListeners();
  }

  void toggleDescription() {
    _isDescriptionExpanded = !_isDescriptionExpanded;
    notifyListeners();
  }
}
