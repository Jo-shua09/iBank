import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBarWidget(context),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/illustration-1.jpg'),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Changed password successfully!',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'You have successfully change password. Please use the new password when Sign in.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ButtonWidget(
                      buttonText: 'Back to Sign In',
                      isActive: true,
                      onPressed: () => context.goNamed('signin'),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBarWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.neutral1,
              size: 16,
            ),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
