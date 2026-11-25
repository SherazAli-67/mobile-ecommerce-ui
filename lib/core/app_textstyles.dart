import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ecommerce_ui/core/app_colors.dart';

class AppTextStyles {
  static TextStyle get greeting => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey4,
      );

  static TextStyle get userName => GoogleFonts.encodeSans(
        fontSize: 16,
        fontWeight: .w700,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get searchHint => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey6,
      );

  static TextStyle get searchInput => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get categorySelected => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w500,
        height: 1.5,
        color: AppColors.grey2,
      );

  static TextStyle get categoryUnselected => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w500,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get productTitle => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get productCategory => GoogleFonts.encodeSans(
        fontSize: 10,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey4,
      );

  static TextStyle get productPrice => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get rating => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get detailTitle => GoogleFonts.encodeSans(
        fontSize: 24,
        fontWeight: .w700,
        height: 1.3,
        color: AppColors.grey10,
      );

  static TextStyle get reviewCount => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get description => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey4,
      );

  static TextStyle get readMore => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get sectionLabel => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w700,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get sizeLabel => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get sizeLabelSelected => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w700,
        height: 1.5,
        color: AppColors.grey2,
      );

  static TextStyle get reviewRating => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.2,
        color: AppColors.grey4,
      );

  static TextStyle get reviewLink => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.2,
        color: AppColors.reviewBlue,
      );

  static TextStyle get quantityBold => GoogleFonts.encodeSans(
        fontSize: 16,
        fontWeight: .w700,
        height: 1.2,
        color: AppColors.grey13,
      );

  static TextStyle get screenTitle => GoogleFonts.encodeSans(
        fontSize: 16,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get shippingTitle => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get cardNumber => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get summaryLabel => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey4,
      );

  static TextStyle get summaryValue => GoogleFonts.encodeSans(
        fontSize: 12,
        fontWeight: .w400,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get subTotalLabel => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get subTotalValue => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w600,
        height: 1.5,
        color: AppColors.grey10,
      );

  static TextStyle get quantity => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w500,
        height: 1.5,
        color: AppColors.grey13,
      );

  static TextStyle get primaryButton => GoogleFonts.encodeSans(
        fontSize: 14,
        fontWeight: .w700,
        height: 1.4,
        color: AppColors.grey2,
      );

  static TextStyle get strikePrice => GoogleFonts.encodeSans(
        fontSize: 10,
        fontWeight: .w400,
        height: 1.4,
        color: AppColors.grey6,
        decoration: .lineThrough,
      );
}
