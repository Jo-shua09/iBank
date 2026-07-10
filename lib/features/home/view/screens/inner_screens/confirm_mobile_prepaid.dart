import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/features/home/view/screens/inner_screens/successful_screen.dart';
import 'package:ibank/core/widgets/button_widget.dart';

class ConfirmMobilePrepaid extends StatelessWidget {
  const ConfirmMobilePrepaid({super.key});

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm transaction information',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'From',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.neutral4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral1),
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
                  Text(
                    'To',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.neutral4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral1),
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
                  Text(
                    'Amount',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.neutral4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral1),
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
                  Text(
                    'Get OTP to verify transaction',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        flex: 6, // Takes 80% of the row
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.neutral4),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.neutral1),
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4, // Takes 20% of the row
                        child: ButtonWidget(
                          buttonText: 'Get OTP',
                          isActive: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ButtonWidget(
                    buttonText: 'Confirm',
                    isActive: true,
                    onPressed: () => context.go(
                      '/success',
                      extra: SuccessfulScreen(
                        text: 'Mobile Prepaid Successful!',
                        description:
                            'You have successfully topped up your mobile. Thanks for using iBank.',
                        buttonText: 'Go to Home',
                      ),
                    ),
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
            'Confirm',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
