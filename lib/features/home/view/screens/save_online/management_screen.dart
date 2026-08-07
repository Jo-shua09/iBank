import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';
import 'package:ibank/core/widgets/top_bar_widget.dart';
import 'package:intl/intl.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: statusBarHeight,
          ), // This is for the status bar padding
          const TopBarWidget(title: 'Management'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _accountbuilder(
                    context,
                    2,
                    1234567890,
                    20000,
                    'Washington D.C',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _accountbuilder(
    BuildContext context,
    int account,
    int accountNumber,
    double balance,
    String branch,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppEffects.dropShadowCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Account $account',
                style: AppTextStyles.body3.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '$accountNumber',
                style: AppTextStyles.body3.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Available Balance',
                style: AppTextStyles.caption2.copyWith(
                  color: AppColors.neutral2,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                '\$${NumberFormat('#,##0.00').format(balance)}',
                style: AppTextStyles.caption2.copyWith(
                  color: AppColors.primary1,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Branch',
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.neutral2,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                branch,
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.primary1,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
