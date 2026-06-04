import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';
import 'package:ibank/routes/app_routes.dart';
import 'package:intl/intl.dart';

class AccountAndCard extends StatefulWidget {
  const AccountAndCard({super.key});

  @override
  State<AccountAndCard> createState() => _AccountAndCardState();
}

class _AccountAndCardState extends State<AccountAndCard> {
  String currentTab = 'account';

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
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // TABS BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            currentTab = 'account';
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: currentTab == 'account'
                                  ? AppColors.primary1
                                  : AppColors.neutral5,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Account',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.caption2.copyWith(
                                color: currentTab == 'account'
                                    ? AppColors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            currentTab = 'card';
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: currentTab == 'card'
                                  ? AppColors.primary1
                                  : AppColors.neutral5,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Card',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.caption2.copyWith(
                                color: currentTab == 'card'
                                    ? AppColors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  //TABS CONTENTS
                  if (currentTab == 'account')
                    Expanded(
                      child: ListView(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColors.white,
                              child: const CircleAvatar(
                                radius: 46,
                                backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/300',
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'John Smith',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.primary1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _accountbuilder(
                            context,
                            1,
                            1234567890,
                            12000,
                            'New York',
                          ),
                          const SizedBox(height: 16),
                          _accountbuilder(
                            context,
                            2,
                            1234567890,
                            20000,
                            'Washington D.C',
                          ),
                          const SizedBox(height: 16),
                          _accountbuilder(
                            context,
                            3,
                            1234567890,
                            280000,
                            'North Carolina',
                          ),
                        ],
                      ),
                    ),

                  if (currentTab == 'card')
                    Expanded(
                      child: ListView(
                        children: [
                          GestureDetector(
                            onTap: () => context.push(
                              AppRouter.cardDetails,
                              extra: 'blueCard',
                            ),
                            child: Image.asset(
                              'assets/images/blue-card.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => context.push(
                              AppRouter.cardDetails,
                              extra: 'goldCard',
                            ),
                            child: Image.asset(
                              'assets/images/gold-card.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 36),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                backgroundColor: AppColors.primary1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                'Add Card',
                                style: AppTextStyles.caption2.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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
            'Account and card',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
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
