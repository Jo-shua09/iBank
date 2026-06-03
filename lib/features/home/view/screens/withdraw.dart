import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _topBarWidget(context),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      width: 300,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/illustration-4.jpg'),
                    ),
                  ),
                  const SizedBox(height: 64),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Choose account/card',
                      hintStyle: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral4,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary1,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.semanticRed,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'account1',
                        child: Text(
                          'Account 1',
                          style: AppTextStyles.caption2.copyWith(
                            color: AppColors.neutral3,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'account2',
                        child: Text(
                          'Account 2',
                          style: AppTextStyles.caption2.copyWith(
                            color: AppColors.neutral3,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (String? value) {
                      // Handle the change when the user selects a new item
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral4,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary1,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.semanticRed,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      hintStyle: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral4,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary1,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.semanticRed,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ButtonWidget(
                    buttonText: 'Verify',
                    isActive: true,
                    onPressed: () => context.goNamed('withdraw-success'),
                  ),
                  const SizedBox(height: 42),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.neutral1,
              size: 16,
            ),
          ),
          Text(
            'Withdraw',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
