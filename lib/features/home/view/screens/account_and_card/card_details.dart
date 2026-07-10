import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';

class CardDetails extends StatelessWidget {
  final String? cardType;

  const CardDetails({super.key, this.cardType});

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
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Text(
                      'Name',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                    trailing: Text(
                      'John Smith',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(color: AppColors.neutral5, height: 0),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Text(
                      'Card Number',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                    trailing: Text(
                      cardType == 'blueCard' ? '122222' : '11111',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(color: AppColors.neutral5, height: 0),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Text(
                      'Valid From',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                    trailing: Text(
                      '9/11',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(color: AppColors.neutral5, height: 0),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Text(
                      'Expires',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                    trailing: Text(
                      '8/22',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(color: AppColors.neutral5, height: 0),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Text(
                      'Available Balance',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                    trailing: Text(
                      '\$3,469.52',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Delete Card',
                      style: AppTextStyles.caption2.copyWith(
                        color: AppColors.semanticRed,
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
            'Card',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
