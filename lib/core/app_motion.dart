import 'package:flutter/material.dart';

class AppMotion {
  AppMotion._();

  static String productImageHeroTag(String productId) => 'product-image-$productId';

  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 280);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration staggerStep = Duration(milliseconds: 60);

  static const Curve standard = Curves.easeOutCubic;
  static const Curve emphasized = Curves.easeInOut;
  static const Curve bounce = Curves.elasticOut;

  static const double pressScale = 0.97;
  static const double staggerOffset = 12;
}
