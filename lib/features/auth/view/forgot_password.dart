import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _topBarWidget(context),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: AppTextStyles.title2.copyWith(
                          color: AppColors.primary1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Enter your email to reset your password',
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.neutral1,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Image(
                          width: 150,
                          image: AssetImage('assets/images/auth-1.jpg'),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const TextFieldWidget(
                        hintText: 'example@email.com',
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 30),
                      ButtonWidget(
                        buttonText: 'Send Reset Link',
                        isActive: true,
                        onPressed: () {
                          // Handle password reset logic
                        },
                      ),
                    ],
                  ),
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
      decoration: BoxDecoration(color: AppColors.primary1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 16,
            ),
            padding: EdgeInsets.zero,
          ),
          Text(
            'Forgot Password',
            style: AppTextStyles.body3.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
