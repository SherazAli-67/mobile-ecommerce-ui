import 'package:flutter/foundation.dart';
import 'package:mobile_ecommerce_ui/core/app_data.dart';
import 'package:mobile_ecommerce_ui/core/models/category_model.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider()
      : _selectedCategoryId = AppData.categories.first.id,
        _favoriteIds = {
          for (final product in AppData.products)
            if (product.isFavorite) product.id,
        };

  String _selectedCategoryId;
  String _searchQuery = '';
  final Set<String> _favoriteIds;

  String get selectedCategoryId => _selectedCategoryId;

  String get searchQuery => _searchQuery;

  List<CategoryModel> get categories => AppData.categories;

  List<ProductModel> get filteredProducts {
    final query = _searchQuery.trim().toLowerCase();
    final selectedName = AppData.categories
        .firstWhere((category) => category.id == _selectedCategoryId)
        .name
        .toLowerCase();
    return AppData.products.where((product) {
      final matchesCategory = _selectedCategoryId == 'all' ||
          product.category.toLowerCase().contains(selectedName) ||
          selectedName.contains(product.category.toLowerCase().split(' ').first);
      final matchesSearch = query.isEmpty ||
          product.name.toLowerCase().contains(query) ||
          product.category.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).map((product) => product.copyWith(isFavorite: _favoriteIds.contains(product.id))).toList();
  }

  void selectCategory(String categoryId) {
    if (_selectedCategoryId == categoryId) return;
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  void updateSearch(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    notifyListeners();
  }

  void toggleFavorite(String productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    notifyListeners();
  }

  bool isFavorite(String productId) => _favoriteIds.contains(productId);
}
