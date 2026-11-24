import 'package:flutter/material.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/product_detail_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductDetailProvider>().product;
    return Scaffold(
      body: Center(child: Text(product.name, style: AppTextStyles.screenTitle,),),
    );
  }
}

class ProductDetailRouteArgs {
  final ProductModel product;

  const ProductDetailRouteArgs({required this.product});
}
