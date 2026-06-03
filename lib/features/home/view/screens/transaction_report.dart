



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';

class TransactionReport extends StatelessWidget {
  const TransactionReport({super.key});

  @override
  Widget build(BuildContext context) {
    // Manually get the height of the notch/status bar
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primary1,
        child: Column(
          children: [
            SizedBox(height: statusBarHeight),
            _topBarWidget(context),
            const SizedBox(height: 50),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 200),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: AppEffects.dropShadowCard,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _listBuilder(
                                  context,
                                  'Water Bill',
                                  'Unsuccessfully',
                                  'Today',
                                  '200',
                                  'out',
                                  Icons.water_drop_rounded,
                                  AppColors.primary1,
                                  AppColors.semanticRed,
                                ),
                                const Divider(color: AppColors.neutral4),
                                _listBuilder(
                                  context,
                                  'Income salary Oct',
                                  '',
                                  'Yesterday',
                                  '1200',
                                  '',
                                  Icons.attach_money_rounded,
                                  AppColors.semanticRed,
                                  AppColors.primary1,
                                ),
                                const Divider(
                                  color: AppColors.neutral4,
                                  height: 20,
                                ),
                                _listBuilder(
                                  context,
                                  'Electric Bill',
                                  'Successfully',
                                  'Yesterday',
                                  '800',
                                  'out',
                                  Icons.electric_bolt_rounded,
                                  AppColors.semanticBlue,
                                  AppColors.semanticRed,
                                ),
                                const Divider(
                                  color: AppColors.neutral4,
                                  height: 20,
                                ),
                                _listBuilder(
                                  context,
                                  'Income: Jane transfers',
                                  '',
                                  'Yesterday',
                                  '500',
                                  '',
                                  Icons.receipt_outlined,
                                  AppColors.semanticYellow,
                                  AppColors.primary1,
                                ),
                                const Divider(
                                  color: AppColors.neutral4,
                                  height: 20,
                                ),
                                _listBuilder(
                                  context,
                                  'Internet Bill',
                                  'Successfully',
                                  'Yesterday',
                                  '100',
                                  'out',
                                  Icons.attach_money_rounded,
                                  AppColors.primary1,
                                  AppColors.semanticRed,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: Image.asset(
                      'assets/images/stack-cards.png',
                      fit: BoxFit.cover,
                      width: 350,
                    ),
                  ),
                ],
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
      height: 70,
      decoration: const BoxDecoration(color: AppColors.primary1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 16,
            ),
          ),
          Text(
            'Transaction report',
            style: AppTextStyles.body1.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _listBuilder(
    BuildContext context,
    String title,
    String subtitle,
    String day,
    String amount,
    String inOrOut,
    IconData icon,
    Color color,
    Color colour,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral3),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: AppColors.white),
          ),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body3.copyWith(color: AppColors.neutral1),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyles.caption1.copyWith(
              color: AppColors.neutral2,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
          trailing: Text(
            '${inOrOut.isEmpty ? '+' : '-'}\$$amount',
            style: AppTextStyles.caption2.copyWith(
              color: colour,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
