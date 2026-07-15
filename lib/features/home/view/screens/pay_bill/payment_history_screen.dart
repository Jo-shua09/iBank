import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  int selectedIndex = 0;

  final tabs = ['Electric', 'Water', 'Mobile', 'Internet'];

  final Map<String, List<Map<String, String>>> allPaymentHistory = {
    'Electric': [
      {
        'title': 'October Electric Bill',
        'date': 'July 10, 2026',
        'status': 'Successful',
        'amount': '\$75.50',
      },
      {
        'title': 'September Electric Bill',
        'date': 'June 10, 2026',
        'status': 'failed',
        'amount': '\$82.30',
      },
    ],
    'Water': [
      {
        'title': 'October Water Bill',
        'date': 'July 05, 2026',
        'status': 'Successful',
        'amount': '\$32.00',
      },
    ],
    'Mobile': [
      {
        'title': 'October Mobile Bill',
        'date': 'July 12, 2026',
        'status': 'Successful',
        'amount': '\$45.00',
      },
    ],
    'Internet': [
      {
        'title': 'October Internet Bill',
        'date': 'July 01, 2026',
        'status': 'Successful',
        'amount': '\$50.00',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final selectedTab = tabs[selectedIndex];
    final paymentHistory = allPaymentHistory[selectedTab] ?? [];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
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
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      children: [
                        ...List.generate(tabs.length, (index) {
                          final bool isCurrentSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;
                            }),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isCurrentSelected
                                    ? AppColors.primary1
                                    : AppColors.neutral5,
                                boxShadow: AppEffects.dropShadowCardSmall,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tabs[index],
                                    style: AppTextStyles.caption2.copyWith(
                                      color: isCurrentSelected
                                          ? AppColors.white
                                          : AppColors.neutral1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: ListView.separated(
                      itemCount: paymentHistory.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = paymentHistory[index];
                        final isSuccess =
                            item['status']!.toLowerCase() == 'successful';
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16.0,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: AppEffects.dropShadowCard,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    item['title']!,
                                    style: AppTextStyles.caption2.copyWith(
                                      color: AppColors.neutral1,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    item['date']!,
                                    style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.neutral3,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Status:',
                                        style: AppTextStyles.caption1.copyWith(
                                          color: AppColors.neutral3,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        item['status']!,
                                        style: AppTextStyles.caption2.copyWith(
                                          color: isSuccess
                                              ? AppColors.semanticGreen
                                              : AppColors.semanticRed,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        'Amount:',
                                        style: AppTextStyles.caption1.copyWith(
                                          color: AppColors.neutral3,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        item['amount']!,
                                        style: AppTextStyles.caption2.copyWith(
                                          color: AppColors.primary1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
            'Payment History',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
