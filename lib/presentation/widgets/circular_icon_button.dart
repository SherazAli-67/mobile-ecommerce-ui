import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_motion.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/scale_on_tap.dart';

class CircularIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final double padding;
  final bool showShadow;
  final bool animateIcon;

  const CircularIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.padding = NumberConstant.circularActionPadding,
    this.showShadow = false,
    this.animateIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = SvgPicture.asset(
      icon,
      key: ValueKey(icon),
      colorFilter: iconColor == null ? null : .mode(iconColor!, .srcIn),
    );

    return ScaleOnTap(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.grey2,
          shape: .circle,
          border: borderColor == null ? null : .all(color: borderColor!),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.grey13.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        padding: .all(padding),
        child: animateIcon
            ? AnimatedSwitcher(
                duration: AppMotion.fast,
                switchInCurve: AppMotion.bounce,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: iconWidget,
              )
            : iconWidget,
      ),
    );
  }
}
