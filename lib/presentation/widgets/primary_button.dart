import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/scale_on_tap.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final String? leadingIcon;
  final String? trailingLabel;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.leadingIcon,
    this.trailingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleOnTap(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey13,
          borderRadius: .circular(NumberConstant.primaryButtonRadius),
        ),
        padding: .symmetric(
          horizontal: NumberConstant.primaryButtonHorizontalPadding,
          vertical: NumberConstant.primaryButtonVerticalPadding,
        ),
        child: Row(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          spacing: NumberConstant.primaryButtonIconGap,
          children: [
            if (leadingIcon != null)
              SvgPicture.asset(
                leadingIcon!,
                colorFilter: .mode(AppColors.grey2, .srcIn),
              ),
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: label, style: AppTextStyles.primaryButton),
                    if (trailingLabel != null)
                      TextSpan(
                        text: ' $trailingLabel',
                        style: AppTextStyles.strikePrice.copyWith(
                          color: AppColors.grey6,
                        ),
                      ),
                  ],
                ),
                textAlign: .center,
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
