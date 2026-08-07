import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    super.key,
    required this.title,
    this.bgColor = AppColors.white,
    this.iconColor = AppColors.neutral1,
    this.titleColor = AppColors.neutral1,
    this.height = 70,
  });

  final String title;
  final Color bgColor;
  final Color iconColor;
  final Color titleColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(color: bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
            ),
            color: iconColor,
          ),
          Text(
            title,
            style: AppTextStyles.body1.copyWith(color: titleColor),
          ),
        ],
      ),
    );
  }
}
