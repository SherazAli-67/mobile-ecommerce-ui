import 'package:mobile_ecommerce_ui/core/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel product;
  final int quantity;

  const CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  double get lineTotal => product.price * quantity;
}
