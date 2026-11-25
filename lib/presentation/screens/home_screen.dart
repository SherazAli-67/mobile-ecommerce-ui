import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/constants/string_const.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_data.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';
import 'package:mobile_ecommerce_ui/core/models/category_model.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/cart_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/home_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/screens/product_detail_screen.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/bottom_nav_bar.dart';
import 'package:mobile_ecommerce_ui/routing/router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: .fromLTRB(NumberConstant.horizontalPadding, NumberConstant.homeTopPadding, NumberConstant.horizontalPadding, 0),
              child: Column(
                spacing: NumberConstant.homeCategoryToGrid,
                children: [
                  Column(
                    spacing: NumberConstant.homeSearchToCategory,
                    children: [
                      Column(
                        spacing: NumberConstant.homeHeaderToSearch,
                        children: [
                          _buildHeader(),
                          _buildSearchBar(homeProvider),
                        ],
                      ),
                      _buildCategories(homeProvider),
                    ],
                  ),
                  Expanded(child: _buildProductGrid(context, homeProvider.filteredProducts)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: NumberConstant.bottomNavBottomOffset,
            child: Center(
              child: BottomNavBar(
                selectedItem: .home,
                showCartBadge: cartProvider.hasItems,
                onItemSelected: (item) => _onNavItemSelected(context, item),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onNavItemSelected(BuildContext context, BottomNavItem item) {
    switch (item) {
      case .home:
        break;
      case .cart:
        context.push(NamedRoutes.checkout.routeName);
      case .favorite:
        context.push(NamedRoutes.favorite.routeName);
      case .profile:
        context.push(NamedRoutes.profile.routeName);
    }
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: NumberConstant.headerSpacing,
            children: [
              Text(StringConst.helloWelcome, style: AppTextStyles.greeting,),
              Text(AppData.userName, style: AppTextStyles.userName,),
            ],
          ),
        ),
        ClipOval(
          child: Image.asset(
            AssetRes.profileAvatar,
            width: NumberConstant.profileAvatarSize,
            height: NumberConstant.profileAvatarSize,
            fit: .cover,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(HomeProvider homeProvider) {
    return Row(
      spacing: NumberConstant.searchFilterGap,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .circular(NumberConstant.radiusSm),
              border: .all(color: AppColors.grey5),
            ),
            padding: .symmetric(horizontal: NumberConstant.searchHorizontalPadding, vertical: NumberConstant.searchVerticalPadding),
            child: Row(
              spacing: NumberConstant.searchIconGap,
              children: [
                SvgPicture.asset(AssetRes.icSearch, colorFilter: .mode(AppColors.grey6, .srcIn),),
                Expanded(
                  child: TextField(
                    onChanged: homeProvider.updateSearch,
                    style: AppTextStyles.searchInput,
                    cursorColor: AppColors.grey13,
                    decoration: InputDecoration(
                      isDense: true,
                      border: .none,
                      enabledBorder: .none,
                      focusedBorder: .none,
                      contentPadding: .zero,
                      hintText: StringConst.searchClothesHint,
                      hintStyle: AppTextStyles.searchHint,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey13,
            borderRadius: .circular(NumberConstant.radiusSm),
          ),
          padding: .all(NumberConstant.filterPadding),
          child: SvgPicture.asset(AssetRes.icFilter, colorFilter: .mode(AppColors.grey2, .srcIn),),
        ),
      ],
    );
  }

  Widget _buildCategories(HomeProvider homeProvider) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        spacing: NumberConstant.categoryGap,
        children: [
          for (final category in homeProvider.categories)
            _buildCategoryChip(
              category: category,
              isSelected: homeProvider.selectedCategoryId == category.id,
              onTap: () => homeProvider.selectCategory(category.id),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip({required CategoryModel category, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.grey13 : AppColors.whiteColor,
          borderRadius: .circular(NumberConstant.radiusSm),
          border: isSelected ? null : .all(color: AppColors.grey5),
        ),
        padding: .symmetric(horizontal: NumberConstant.chipHorizontalPadding, vertical: NumberConstant.chipVerticalPadding),
        child: Row(
          mainAxisSize: .min,
          spacing: NumberConstant.chipIconGap,
          children: [
            SvgPicture.asset(category.icon, colorFilter: .mode(isSelected ? AppColors.grey2 : AppColors.grey13, .srcIn),),
            Text(category.name, style: isSelected ? AppTextStyles.categorySelected : AppTextStyles.categoryUnselected,),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, List<ProductModel> products) {
    final leftProducts = <ProductModel>[];
    final rightProducts = <ProductModel>[];
    for (var i = 0; i < products.length; i++) {
      if (i.isEven) {
        leftProducts.add(products[i]);
      } else {
        rightProducts.add(products[i]);
      }
    }
    return SingleChildScrollView(
      padding: .only(bottom: NumberConstant.homeBottomContentPadding),
      child: Row(
        crossAxisAlignment: .start,
        spacing: NumberConstant.productGridGap,
        children: [
          Expanded(
            child: Column(
              spacing: NumberConstant.sectionSpacing,
              children: [
                for (final product in leftProducts) _buildProductCard(context, product),
              ],
            ),
          ),
          Expanded(
            child: Column(
              spacing: NumberConstant.sectionSpacing,
              children: [
                for (final product in rightProducts) _buildProductCard(context, product),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, ProductModel product) {
    final homeProvider = context.read<HomeProvider>();
    return GestureDetector(
      onTap: () => context.push(
        NamedRoutes.productDetail.location(id: product.id),
        extra: ProductDetailRouteArgs(product: product),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: NumberConstant.productCardSpacing,
        children: [
          AspectRatio(
            aspectRatio: product.useTallImage ? NumberConstant.productImageAspectTall : NumberConstant.productImageAspectShort,
            child: Stack(
              fit: .expand,
              children: [
                ClipRRect(
                  borderRadius: .circular(NumberConstant.radiusMd),
                  child: Image.asset(product.image, fit: .cover, width: double.infinity, height: double.infinity,),
                ),
                Positioned(
                  top: NumberConstant.favoriteOverlayInset,
                  right: NumberConstant.favoriteOverlayInset,
                  child: GestureDetector(
                    onTap: () => homeProvider.toggleFavorite(product.id),
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.grey13, shape: .circle),
                      padding: .all(NumberConstant.favoriteOverlayPadding),
                      child: SvgPicture.asset(
                        product.isFavorite ? AssetRes.icFavoriteFilled : AssetRes.icFavoriteOutlined,
                        colorFilter: .mode(AppColors.grey2, .srcIn),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: .start,
            spacing: NumberConstant.productTextSpacing,
            children: [
              Column(
                crossAxisAlignment: .start,
                spacing: NumberConstant.productMetaSpacing,
                children: [
                  Text(product.name, style: AppTextStyles.productTitle, maxLines: 1, overflow: .ellipsis,),
                  Text(product.category, style: AppTextStyles.productCategory, maxLines: 1, overflow: .ellipsis,),
                ],
              ),
              Row(
                children: [
                  Text(StringConst.price(product.price), style: AppTextStyles.productPrice,),
                  const Spacer(),
                  Row(
                    mainAxisSize: .min,
                    spacing: NumberConstant.ratingIconGap,
                    children: [
                      SvgPicture.asset(AssetRes.icStar),
                      Text(product.rating.toStringAsFixed(1), style: AppTextStyles.rating,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
