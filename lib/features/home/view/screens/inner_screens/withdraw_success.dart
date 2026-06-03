import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';

class WithdrawSuccess extends StatelessWidget {
  const WithdrawSuccess({super.key});

  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      width: 300,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/illustration-4.jpg'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Withdrawal Successful!',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.primary1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    'You have successfully withdrawn money! Please check the balance in the card management section.',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget(
                    buttonText: 'Continue',
                    isActive: true,
                    onPressed: () => context.goNamed('home'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
