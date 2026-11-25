import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/constants/string_const.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_motion.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/cart_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/product_detail_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/circular_icon_button.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/primary_button.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/quantity_stepper.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/staggered_fade_slide.dart';
import 'package:mobile_ecommerce_ui/routing/router.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _cartPulse = false;
  bool _addingToCart = false;

  Future<void> _onAddToCart(ProductDetailProvider provider) async {
    if (_addingToCart) return;
    _addingToCart = true;

    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    if (!disableAnimations) {
      setState(() => _cartPulse = true);
      await Future<void>.delayed(AppMotion.normal);
      if (!mounted) return;
      setState(() => _cartPulse = false);
    }

    final product = provider.product;
    context.read<CartProvider>().addProduct(product, quantity: provider.quantity);
    context.push(NamedRoutes.checkout.routeName);
    _addingToCart = false;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final product = provider.product;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: .fromLTRB(
            NumberConstant.horizontalPadding,
            NumberConstant.homeTopPadding,
            NumberConstant.horizontalPadding,
            NumberConstant.detailBottomPadding,
          ),
          child: Column(
            spacing: NumberConstant.detailSectionSpacing,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: NumberConstant.detailSectionSpacing,
                    children: [
                      _buildHero(context, provider),
                      StaggeredFadeSlide(
                        index: 0,
                        child: _buildDetails(provider),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedScale(
                scale: _cartPulse ? 1.04 : 1,
                duration: AppMotion.fast,
                curve: AppMotion.emphasized,
                child: PrimaryButton(
                  label: StringConst.addToCartLabel(product.price),
                  leadingIcon: AssetRes.icCart,
                  trailingLabel: product.originalPrice == null
                      ? null
                      : StringConst.price(product.originalPrice!),
                  onTap: () => _onAddToCart(provider),
                ),
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
          Hero(
            tag: AppMotion.productImageHeroTag(provider.product.id),
            child: ClipRRect(
              borderRadius: .circular(NumberConstant.radiusMd),
              child: Image.asset(
                provider.product.image,
                fit: .cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
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
              icon: provider.isFavorite
                  ? AssetRes.icFavoriteFilled
                  : AssetRes.icFavoriteOutlined,
              showShadow: true,
              iconColor: AppColors.grey13,
              animateIcon: true,
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
                  Text(product.name, style: AppTextStyles.detailTitle),
                  Row(
                    spacing: NumberConstant.reviewGap,
                    children: [
                      SvgPicture.asset(AssetRes.icStar),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: product.rating.toStringAsFixed(1),
                              style: AppTextStyles.reviewRating,
                            ),
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: StringConst.formattedReviews(
                                product.reviewCount,
                              ),
                              style: AppTextStyles.reviewLink,
                            ),
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
        _buildDescription(provider, product.description),
        const Divider(color: AppColors.grey5, height: 1),
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

  Widget _buildDescription(ProductDetailProvider provider, String description) {
    final expanded = provider.isDescriptionExpanded;
    return GestureDetector(
      onTap: provider.toggleDescription,
      behavior: HitTestBehavior.opaque,
      child: AnimatedSize(
        duration: AppMotion.normal,
        curve: AppMotion.standard,
        alignment: Alignment.topLeft,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: description,
                style: AppTextStyles.description,
              ),
              TextSpan(
                text: expanded
                    ? ' ${StringConst.readLess}'
                    : ' ${StringConst.readMore}',
                style: AppTextStyles.readMore,
              ),
            ],
          ),
          maxLines: expanded ? null : 2,
          overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildSizeSection(ProductDetailProvider provider) {
    return Column(
      crossAxisAlignment: .start,
      spacing: NumberConstant.detailOptionsSpacing,
      children: [
        Text(StringConst.chooseSize, style: AppTextStyles.sectionLabel),
        Row(
          spacing: NumberConstant.sizeChipGap,
          children: [
            for (final size in provider.sizes)
              GestureDetector(
                onTap: () => provider.selectSize(size),
                child: AnimatedScale(
                  scale: provider.selectedSize == size ? 1.08 : 1,
                  duration: AppMotion.fast,
                  curve: AppMotion.emphasized,
                  child: AnimatedContainer(
                    duration: AppMotion.fast,
                    curve: AppMotion.emphasized,
                    decoration: BoxDecoration(
                      color: provider.selectedSize == size
                          ? AppColors.grey13
                          : AppColors.whiteColor,
                      shape: .circle,
                      border: provider.selectedSize == size
                          ? null
                          : .all(color: AppColors.grey5),
                    ),
                    padding: .all(NumberConstant.sizeChipPadding),
                    child: AnimatedDefaultTextStyle(
                      duration: AppMotion.fast,
                      curve: AppMotion.emphasized,
                      style: provider.selectedSize == size
                          ? AppTextStyles.sizeLabelSelected
                          : AppTextStyles.sizeLabel,
                      child: Text(size),
                    ),
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
        Text(StringConst.color, style: AppTextStyles.sectionLabel),
        Row(
          spacing: NumberConstant.colorChipGap,
          children: [
            for (final color in ProductDetailProvider.colors)
              GestureDetector(
                onTap: () => provider.selectColor(color),
                child: AnimatedScale(
                  scale: provider.selectedColor == color ? 1.12 : 1,
                  duration: AppMotion.fast,
                  curve: AppMotion.emphasized,
                  child: AnimatedContainer(
                    duration: AppMotion.fast,
                    curve: AppMotion.emphasized,
                    width: NumberConstant.colorSwatchExtent,
                    height: NumberConstant.colorSwatchExtent,
                    decoration: BoxDecoration(
                      color: color,
                      shape: .circle,
                      border: provider.selectedColor == color
                          ? .all(color: AppColors.grey2, width: 2)
                          : .all(color: Colors.transparent, width: 0),
                    ),
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
