import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_ecommerce_ui/constants/number_constant.dart';
import 'package:mobile_ecommerce_ui/constants/string_const.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';
import 'package:mobile_ecommerce_ui/core/app_textstyles.dart';
import 'package:mobile_ecommerce_ui/core/asset_res.dart';
import 'package:mobile_ecommerce_ui/core/models/cart_item_model.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/cart_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/circular_icon_button.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/primary_button.dart';
import 'package:mobile_ecommerce_ui/presentation/widgets/quantity_stepper.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: .fromLTRB(NumberConstant.horizontalPadding, NumberConstant.homeTopPadding, NumberConstant.horizontalPadding, NumberConstant.detailBottomPadding),
          child: Column(
            spacing: NumberConstant.checkoutSectionSpacing,
            children: [
              _buildAppBar(context),
              Expanded(child: _buildCartList(cartProvider)),
              _buildShippingInformation(),
              _buildSummary(cartProvider),
              PrimaryButton(label: StringConst.pay, onTap: () {},),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: NumberConstant.checkoutAppBarPadding),
      child: Row(
        children: [
          CircularIconButton(
            icon: AssetRes.icArrowBack,
            backgroundColor: AppColors.whiteColor,
            borderColor: AppColors.grey5,
            iconColor: AppColors.grey13,
            onTap: () => context.pop(),
          ),
          Expanded(child: Text(StringConst.checkout, style: AppTextStyles.screenTitle, textAlign: .center,),),
          CircularIconButton(
            icon: AssetRes.icMenu,
            backgroundColor: AppColors.whiteColor,
            borderColor: AppColors.grey5,
            iconColor: AppColors.grey13,
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(CartProvider cartProvider) {
    final items = cartProvider.items;
    if (items.isEmpty) {
      return Center(child: Text(StringConst.checkout, style: AppTextStyles.summaryLabel,),);
    }
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(color: AppColors.grey5, height: NumberConstant.checkoutSectionSpacing,),
      itemBuilder: (context, index) => _buildCartItem(cartProvider, items[index]),
    );
  }

  Widget _buildCartItem(CartProvider cartProvider, CartItemModel item) {
    final product = item.product;
    return Row(
      spacing: NumberConstant.cartItemGap,
      children: [
        ClipRRect(
          borderRadius: .circular(NumberConstant.cartThumbRadius),
          child: Image.asset(
            product.image,
            width: NumberConstant.cartThumbSize,
            height: NumberConstant.cartThumbSize,
            fit: .cover,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: NumberConstant.cartItemContentGap,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      spacing: NumberConstant.headerSpacing,
                      children: [
                        Text(product.name, style: AppTextStyles.productTitle, maxLines: 1, overflow: .ellipsis,),
                        Text(product.category, style: AppTextStyles.productCategory, maxLines: 1, overflow: .ellipsis,),
                      ],
                    ),
                    Text(StringConst.price(product.price), style: AppTextStyles.productPrice,),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: .end,
                spacing: NumberConstant.cartItemActionsGap,
                children: [
                  SvgPicture.asset(AssetRes.icMenu, colorFilter: .mode(AppColors.grey13, .srcIn),),
                  QuantityStepper(
                    quantity: item.quantity,
                    compact: true,
                    onIncrement: () => cartProvider.increment(item.id),
                    onDecrement: () => cartProvider.decrement(item.id),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShippingInformation() {
    return Column(
      crossAxisAlignment: .start,
      spacing: NumberConstant.detailContentSpacing,
      children: [
        Text(StringConst.shippingInformation, style: AppTextStyles.shippingTitle,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.paymentCardBg,
            borderRadius: .circular(NumberConstant.radiusSm),
          ),
          padding: .symmetric(horizontal: NumberConstant.paymentCardPadding, vertical: NumberConstant.paymentCardVerticalPadding),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  spacing: NumberConstant.productTextSpacing,
                  children: [
                    Image.asset(
                      AssetRes.visa,
                      width: NumberConstant.visaWidth,
                      height: NumberConstant.visaHeight,
                      fit: .contain,
                    ),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: StringConst.maskedCardPrefix, style: AppTextStyles.cardNumber,),
                            TextSpan(text: StringConst.maskedCardLastFour, style: AppTextStyles.cardNumberSuffix,),
                          ],
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(AssetRes.icArrowDropdown, colorFilter: .mode(AppColors.grey13, .srcIn),),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummary(CartProvider cartProvider) {
    return Column(
      spacing: NumberConstant.checkoutSummaryGap,
      children: [
        _buildSummaryRow(label: StringConst.totalItems(cartProvider.totalQuantity), value: StringConst.price(cartProvider.itemsTotal),),
        _buildSummaryRow(label: StringConst.shippingFee, value: StringConst.price(cartProvider.shippingFee),),
        _buildSummaryRow(label: StringConst.discount, value: StringConst.price(cartProvider.discount),),
        const Divider(color: AppColors.grey5, height: NumberConstant.checkoutSectionSpacing,),
        _buildSummaryRow(
          label: StringConst.subTotal,
          value: StringConst.price(cartProvider.subTotal),
          labelStyle: AppTextStyles.subTotalLabel,
          valueStyle: AppTextStyles.subTotalValue,
        ),
      ],
    );
  }

  Widget _buildSummaryRow({
    required String label,
    required String value,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
  }) {
    return Row(
      children: [
        Expanded(child: Text(label, style: labelStyle ?? AppTextStyles.summaryLabel,),),
        Text(value, style: valueStyle ?? AppTextStyles.summaryValue,),
      ],
    );
  }
}
