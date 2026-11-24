import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';

class CircularIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final double padding;
  final bool showShadow;

  const CircularIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.padding = NumberConstant.circularActionPadding,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.grey2,
          shape: .circle,
          border: borderColor == null ? null : .all(color: borderColor!),
          boxShadow: showShadow
              ? [BoxShadow(color: AppColors.grey13.withValues(alpha: 0.1), blurRadius: 12, offset: const Offset(0, 4))]
              : null,
        ),
        padding: .all(padding),
        child: SvgPicture.asset(icon, colorFilter: iconColor == null ? null : .mode(iconColor!, .srcIn),),
      ),
    );
  }
}
