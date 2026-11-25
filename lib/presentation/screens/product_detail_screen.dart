import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/constants/string_const.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/cart_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/product_detail_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/circular_icon_button.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/primary_button.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/quantity_stepper.dart';
import 'package:mobile_ecommerce_ui/routing/router.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final product = provider.product;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: .fromLTRB(NumberConstant.horizontalPadding, NumberConstant.homeTopPadding, NumberConstant.horizontalPadding, NumberConstant.detailBottomPadding),
          child: Column(
            spacing: NumberConstant.detailSectionSpacing,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: NumberConstant.detailSectionSpacing,
                    children: [
                      _buildHero(context, provider),
                      _buildDetails(provider),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                label: StringConst.addToCartLabel(product.price),
                leadingIcon: AssetRes.icCart,
                trailingLabel: product.originalPrice == null ? null : StringConst.price(product.originalPrice!),
                onTap: () {
                  context.read<CartProvider>().addProduct(product, quantity: provider.quantity);
                  context.push(NamedRoutes.checkout.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, ProductDetailProvider provider) {
    return AspectRatio(
      aspectRatio: NumberConstant.detailImageAspect,
      child: Stack(
        fit: .expand,
        children: [
          ClipRRect(
            borderRadius: .circular(NumberConstant.radiusMd),
            child: Image.asset(provider.product.image, fit: .cover, width: double.infinity, height: double.infinity,),
          ),
          Positioned(
            top: NumberConstant.detailImageActionInset,
            left: NumberConstant.detailImageActionInset,
            child: CircularIconButton(
              icon: AssetRes.icArrowBack,
              showShadow: true,
              iconColor: AppColors.grey13,
              onTap: () => context.pop(),
            ),
          ),
          Positioned(
            top: NumberConstant.detailImageActionInset,
            right: NumberConstant.detailImageActionInset,
            child: CircularIconButton(
              icon: provider.isFavorite ? AssetRes.icFavoriteFilled : AssetRes.icFavoriteOutlined,
              showShadow: true,
              iconColor: AppColors.grey13,
              onTap: provider.toggleFavorite,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(ProductDetailProvider provider) {
    final product = provider.product;
    return Column(
      crossAxisAlignment: .start,
      spacing: NumberConstant.detailContentSpacing,
      children: [
        Row(
          crossAxisAlignment: .center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: NumberConstant.headerSpacing,
                children: [
                  Text(product.name, style: AppTextStyles.detailTitle,),
                  Row(
                    spacing: NumberConstant.reviewGap,
                    children: [
                      SvgPicture.asset(AssetRes.icStar),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: product.rating.toStringAsFixed(1), style: AppTextStyles.reviewRating,),
                            const TextSpan(text: ' '),
                            TextSpan(text: StringConst.formattedReviews(product.reviewCount), style: AppTextStyles.reviewLink,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            QuantityStepper(
              quantity: provider.quantity,
              onIncrement: provider.increment,
              onDecrement: provider.decrement,
              quantityStyle: AppTextStyles.quantityBold,
            ),
          ],
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: product.description, style: AppTextStyles.description,),
              if (!provider.isDescriptionExpanded)
                WidgetSpan(
                  alignment: .baseline,
                  baseline: .alphabetic,
                  child: GestureDetector(
                    onTap: provider.toggleDescription,
                    child: Text(' ${StringConst.readMore}', style: AppTextStyles.readMore,),
                  ),
                ),
            ],
          ),
        ),
        const Divider(color: AppColors.grey5, height: 1,),
        Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(child: _buildSizeSection(provider)),
            _buildColorSection(provider),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeSection(ProductDetailProvider provider) {
    return Column(
      crossAxisAlignment: .start,
      spacing: NumberConstant.detailOptionsSpacing,
      children: [
        Text(StringConst.chooseSize, style: AppTextStyles.sectionLabel,),
        Row(
          spacing: NumberConstant.sizeChipGap,
          children: [
            for (final size in provider.sizes)
              GestureDetector(
                onTap: () => provider.selectSize(size),
                child: Container(
                  decoration: BoxDecoration(
                    color: provider.selectedSize == size ? AppColors.grey13 : AppColors.whiteColor,
                    shape: .circle,
                    border: provider.selectedSize == size ? null : .all(color: AppColors.grey5),
                  ),
                  padding: .all(NumberConstant.sizeChipPadding),
                  child: Text(
                    size,
                    style: provider.selectedSize == size ? AppTextStyles.sizeLabelSelected : AppTextStyles.sizeLabel,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorSection(ProductDetailProvider provider) {
    return Column(
      crossAxisAlignment: .start,
      spacing: NumberConstant.detailOptionsSpacing,
      children: [
        Text(StringConst.color, style: AppTextStyles.sectionLabel,),
        Row(
          spacing: NumberConstant.colorChipGap,
          children: [
            for (final color in ProductDetailProvider.colors)
              GestureDetector(
                onTap: () => provider.selectColor(color),
                child: Container(
                  width: NumberConstant.colorSwatchExtent,
                  height: NumberConstant.colorSwatchExtent,
                  decoration: BoxDecoration(
                    color: color,
                    shape: .circle,
                    border: provider.selectedColor == color ? .all(color: AppColors.grey2, width: 2) : null,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class ProductDetailRouteArgs {
  final ProductModel product;

  const ProductDetailRouteArgs({required this.product});
}
