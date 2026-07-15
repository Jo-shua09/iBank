import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';

class PayBills extends StatelessWidget {
  const PayBills({super.key});

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
                  _listBuilder(
                    context,
                    'Electric bill',
                    'Pay electric bill this month',
                    'assets/images/bill-1.jpg',
                  ),
                  const SizedBox(height: 16.0),
                  _listBuilder(
                    context,
                    'Water bill',
                    'Pay water bill this month',
                    'assets/images/bill-2.jpg',
                  ),
                  const SizedBox(height: 16.0),
                  _listBuilder(
                    context,
                    'Mobile bill',
                    'Pay mobile bill this month',
                    'assets/images/bill-3.jpg',
                  ),
                  const SizedBox(height: 16.0),
                  _listBuilder(
                    context,
                    'Internet bill',
                    'Pay internet bill this month',
                    'assets/images/bill-4.jpg',
                  ),
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
            'Pay Bills',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }

  Widget _listBuilder(
    BuildContext context,
    String title,
    String subtitle,
    String imageUrl,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppEffects.dropShadowCard,
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.body2.copyWith(
            color: AppColors.neutral1,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral2),
        ),
        trailing: Image.asset(imageUrl),
        onTap: () {
          final billId = title.toLowerCase().replaceAll(' ', '-');
          context.pushNamed('bill-details', pathParameters: {'billId': billId});
        },
      ),
    );
  }
}
