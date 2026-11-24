import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';

class QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final bool compact;

  const QuantityStepper({
    super.key,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final actionPadding = compact ? NumberConstant.quantityActionPaddingCompact : NumberConstant.quantityActionPadding;
    return Row(
      mainAxisSize: .min,
      spacing: NumberConstant.quantityStepperGap,
      children: [
        _buildAction(icon: AssetRes.icMinus, onTap: onDecrement, padding: actionPadding),
        Text('$quantity', style: AppTextStyles.quantity,),
        _buildAction(icon: AssetRes.icAdd, onTap: onIncrement, padding: actionPadding),
      ],
    );
  }

  Widget _buildAction({required String icon, required VoidCallback? onTap, required double padding}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(shape: .circle, border: .all(color: AppColors.grey5),),
        padding: .all(padding),
        child: SvgPicture.asset(icon, colorFilter: .mode(AppColors.grey13, .srcIn),),
      ),
    );
  }
}
