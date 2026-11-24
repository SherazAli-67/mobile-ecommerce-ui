import 'package:mobile_ecommerce_ui/constants/string_const.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';
import 'package:mobile_ecommerce_ui/core/models/cart_item_model.dart';
import 'package:mobile_ecommerce_ui/core/models/category_model.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';

class AppData {
  static const userName = StringConst.userName;
  static const maskedCardNumber = StringConst.maskedCardNumber;
  static const shippingFee = 0.0;
  static const discount = 0.0;

  static const sizes = ['S', 'M', 'L', 'XL'];

  static const categories = [
    CategoryModel(id: 'all', name: StringConst.categoryAllItems, icon: AssetRes.icCategory),
    CategoryModel(id: 'dress', name: StringConst.categoryDress, icon: AssetRes.icDress),
    CategoryModel(id: 'tshirt', name: StringConst.categoryTshirt, icon: AssetRes.icTshirt),
    CategoryModel(id: 'jeans', name: StringConst.categoryJeans, icon: AssetRes.icJeans),
  ];

  static const products = [
    ProductModel(
      id: '1',
      name: StringConst.productModernLightClothes,
      category: StringConst.categoryTshirt,
      price: 212.99,
      rating: 5.0,
      reviewCount: 7932,
      image: AssetRes.product1,
      description: StringConst.productDescription,
      useTallImage: false,
    ),
    ProductModel(
      id: '2',
      name: StringConst.productLightDressBless,
      category: StringConst.dressModern,
      price: 162.99,
      originalPrice: 190.99,
      rating: 5.0,
      reviewCount: 7932,
      image: AssetRes.product2,
      description: StringConst.productDescription,
      isFavorite: true,
      useTallImage: true,
    ),
    ProductModel(
      id: '3',
      name: StringConst.productMaroonDarkTop,
      category: StringConst.categoryDress,
      price: 194.99,
      rating: 5.0,
      reviewCount: 4201,
      image: AssetRes.product3,
      description: StringConst.productDescription,
      useTallImage: false,
    ),
    ProductModel(
      id: '4',
      name: StringConst.productLightDressYellow,
      category: StringConst.dressModern,
      price: 122.99,
      rating: 5.0,
      reviewCount: 3104,
      image: AssetRes.product4,
      description: StringConst.productDescription,
      useTallImage: true,
    ),
  ];

  static final cartItems = [
    CartItemModel(id: 'c1', product: products[0], quantity: 4),
    CartItemModel(id: 'c2', product: products[1], quantity: 1),
  ];
}
