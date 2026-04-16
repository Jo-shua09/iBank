import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      primaryColor: AppColors.primary1,
      scaffoldBackgroundColor: AppColors.white,
      
      textTheme: const TextTheme(
        // Title 1: SemiBold 24px
        displayLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.neutral1),
        
        // Title 2: SemiBold 20px
        displayMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.neutral1),
        
        // Title 3: SemiBold 16px
        displaySmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.neutral1),
        
        // Body 1: Medium 16px
        bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.neutral1),
        
        // Body 2: Regular 16px
        bodyMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.neutral2),
        
        // Body 3: Medium 14px (Mapping to bodySmall)
        bodySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.neutral1),
        
        // Caption 1: SemiBold 12px
        labelLarge: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.neutral3),
        
        // Caption 2: Medium 14px
        labelMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.neutral2),
      ),
    );
  }
}