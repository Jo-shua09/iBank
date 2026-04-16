import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String _fontFamily = 'Poppins';

  // --- TITLES ---

  /// Title 1: SemiBold 24px
  static const TextStyle title1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral1,
  );

  /// Title 2: SemiBold 20px
  static const TextStyle title2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral1,
  );

  /// Title 3: SemiBold 16px
  static const TextStyle title3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral1,
  );

  // --- BODY TEXT ---

  /// Body 1: Medium 16px
  static const TextStyle body1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.neutral1,
  );

  /// Body 2: Regular 16px
  static const TextStyle body2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.neutral2,
  );

  /// Body 3: Medium 14px
  static const TextStyle body3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.neutral1,
  );

  // --- CAPTIONS ---

  /// Caption 1: SemiBold 12px
  static const TextStyle caption1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral3,
  );

  /// Caption 2: Medium 14px
  static const TextStyle caption2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.neutral2,
  );
}
