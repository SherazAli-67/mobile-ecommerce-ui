import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_motion.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/scale_on_tap.dart';

class QuantityStepper extends StatefulWidget {
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final bool compact;
  final TextStyle? quantityStyle;

  const QuantityStepper({
    super.key,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
    this.compact = false,
    this.quantityStyle,
  });

  @override
  State<QuantityStepper> createState() => _QuantityStepperState();
}

class _QuantityStepperState extends State<QuantityStepper> {
  bool _increasing = true;

  @override
  void didUpdateWidget(covariant QuantityStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.quantity != oldWidget.quantity) {
      _increasing = widget.quantity > oldWidget.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    final actionPadding = widget.compact
        ? NumberConstant.quantityActionPaddingCompact
        : NumberConstant.quantityActionPadding;
    return Row(
      mainAxisSize: .min,
      spacing: NumberConstant.quantityStepperGap,
      children: [
        _buildAction(
          icon: AssetRes.icMinus,
          onTap: widget.onDecrement,
          padding: actionPadding,
        ),
        AnimatedSwitcher(
          duration: AppMotion.fast,
          switchInCurve: AppMotion.standard,
          switchOutCurve: AppMotion.emphasized,
          transitionBuilder: (child, animation) {
            final offset = Tween<Offset>(
              begin: Offset(0, _increasing ? 0.35 : -0.35),
              end: Offset.zero,
            ).animate(animation);
            return ClipRect(
              child: SlideTransition(
                position: offset,
                child: FadeTransition(opacity: animation, child: child),
              ),
            );
          },
          child: Text(
            '${widget.quantity}',
            key: ValueKey(widget.quantity),
            style: widget.quantityStyle ?? AppTextStyles.quantity,
          ),
        ),
        _buildAction(
          icon: AssetRes.icAdd,
          onTap: widget.onIncrement,
          padding: actionPadding,
        ),
      ],
    );
  }

  Widget _buildAction({
    required String icon,
    required VoidCallback? onTap,
    required double padding,
  }) {
    return ScaleOnTap(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: .circle,
          border: .all(color: AppColors.grey5),
        ),
        padding: .all(padding),
        child: SvgPicture.asset(
          icon,
          colorFilter: .mode(AppColors.grey13, .srcIn),
        ),
      ),
    );
  }
}
