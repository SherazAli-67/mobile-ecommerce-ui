import 'package:flutter/material.dart';
import 'package:mobile_ecommerce_ui/constants/string_const.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';

class AppTextStyles {
  static const _fontFamily = StringConst.appFontFamily;

  static TextStyle get greeting => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey4,
      );

  static TextStyle get userName => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: .w700,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get searchHint => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey6,
      );

  static TextStyle get searchInput => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get categorySelected => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w500,
        height: 1.5,
        color: AppColors.grey2,
      );

  static TextStyle get categoryUnselected => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w500,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get productTitle => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get productCategory => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey4,
      );

  static TextStyle get productPrice => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get rating => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get detailTitle => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        fontWeight: .w700,
        height: 1.3,
        color: AppColors.grey10,
      );

  static TextStyle get reviewCount => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get description => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey4,
      );

  static TextStyle get readMore => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get sectionLabel => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w700,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get sizeLabel => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get sizeLabelSelected => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w700,
        height: 1.5,
        color: AppColors.grey2,
      );

  static TextStyle get reviewRating => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w400,
        height: 1.2,
        color: AppColors.grey4,
      );

  static TextStyle get reviewLink => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: .w400,
        height: 1.2,
        color: AppColors.reviewBlue,
      );

  static TextStyle get quantityBold => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: .w700,
        height: 1.2,
        color: AppColors.grey13,
      );

  static TextStyle get screenTitle => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get shippingTitle => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get cardNumber => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w600,
        height: 1.4,
        color: AppColors.grey13,
      );

  static TextStyle get cardNumberSuffix => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w400,
        height: 1.4,
        color: AppColors.grey13,
      );

  static TextStyle get summaryLabel => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get summaryValue => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get subTotalLabel => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get subTotalValue => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get quantity => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w500,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get primaryButton => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: .w700,
        height: 1.4,
        color: AppColors.grey2,
      );

  static TextStyle get strikePrice => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        fontWeight: .w400,
        height: 1.4,
        color: AppColors.grey6,
        decoration: .lineThrough,
      );
}
