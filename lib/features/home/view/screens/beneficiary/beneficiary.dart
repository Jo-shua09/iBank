import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/top_bar_widget.dart';
import 'package:ibank/core/utils/effects.dart';

class Beneficiary extends StatelessWidget {
  const Beneficiary({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddNewBeneficiary screen
          context.pushNamed('add-beneficiary');
        },
        backgroundColor: AppColors.primary1,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 25, color: AppColors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          const TopBarWidget(title: 'Beneficiary', showSearchIcon: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _listBuilder(
                    context,
                    'Transfer via card number',
                    'assets/images/auth-1.jpg',
                    'John Doe',
                    '1234567890',
                    'assets/images/auth-1.jpg',
                    'Jane Smith',
                    '1234567890',
                  ),
                  const SizedBox(height: 16.0),
                  _listBuilder(
                    context,
                    'Transfer to same bank',
                    'assets/images/auth-1.jpg',
                    'John Doe',
                    '1234567890',
                    'assets/images/auth-1.jpg',
                    'Jane Smith',
                    '1234567890',
                  ),
                  const SizedBox(height: 16.0),
                  _listBuilder(
                    context,
                    'Transfer to another bank',
                    'assets/images/auth-1.jpg',
                    'John Doe',
                    '1234567890',
                    'assets/images/auth-1.jpg',
                    'Jane Smith',
                    '1234567890',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listBuilder(
    BuildContext context,
    String category,
    String imageUrl,
    String title,
    String subtitle,
    String imageUrl2,
    String title2,
    String subtitle2,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral3),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: AppEffects.dropShadowCard,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.caption2.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          subtitle,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.neutral2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 32,
                thickness: 0.5,
                color: AppColors.neutral4,
              ),
              Row(
                children: [
                  Image.asset(
                    imageUrl2,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title2,
                          style: AppTextStyles.caption2.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          subtitle2,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.neutral2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
