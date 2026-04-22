import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibank/core/constants/app_colors.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    super.key,
    required this.iconPath,
    this.size = 24.0,
    this.color = AppColors.primary1,
    this.onTap,
  });

  final String iconPath;
  final double size;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        'assets/icons/$iconPath',
        width: size,
        height: size,
        // colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
