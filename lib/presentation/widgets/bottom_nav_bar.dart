import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';

enum BottomNavItem { home, cart, favorite, profile }

class BottomNavBar extends StatelessWidget {
  final BottomNavItem selectedItem;
  final ValueChanged<BottomNavItem>? onItemSelected;
  final bool showCartBadge;

  const BottomNavBar({
    super.key,
    required this.selectedItem,
    this.onItemSelected,
    this.showCartBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey13,
        borderRadius: .circular(NumberConstant.radiusPill),
      ),
      padding: .symmetric(
        horizontal: NumberConstant.bottomNavHorizontalPadding,
        vertical: NumberConstant.bottomNavVerticalPadding,
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: NumberConstant.bottomNavItemGap,
        children: [
          _buildNavItem(item: .home, icon: AssetRes.icHome),
          _buildNavItem(item: .cart, icon: AssetRes.icCart, showBadge: showCartBadge),
          _buildNavItem(item: .favorite, icon: AssetRes.icFavoriteOutlined),
          _buildNavItem(item: .profile, icon: AssetRes.icProfile),
        ],
      ),
    );
  }

  Widget _buildNavItem({required BottomNavItem item, required String icon, bool showBadge = false}) {
    final isSelected = selectedItem == item;
    return GestureDetector(
      onTap: () => onItemSelected?.call(item),
      child: Padding(
        padding: .all(NumberConstant.bottomNavItemPadding),
        child: Stack(
          clipBehavior: .none,
          alignment: .center,
          children: [
            SvgPicture.asset(icon, colorFilter: .mode(AppColors.grey2, .srcIn),),
            if (isSelected)
              Positioned(
                bottom: -NumberConstant.bottomNavDotSize * 2,
                child: Container(
                  width: NumberConstant.bottomNavDotSize,
                  height: NumberConstant.bottomNavDotSize,
                  decoration: BoxDecoration(color: AppColors.grey2, shape: .circle),
                ),
              ),
            if (showBadge)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: NumberConstant.bottomNavBadgeSize,
                  height: NumberConstant.bottomNavBadgeSize,
                  decoration: BoxDecoration(color: AppColors.badgeRed, shape: .circle),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
