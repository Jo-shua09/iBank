import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/data/dummy_data.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _topBarWidget(context),
            const SizedBox(height: 8),
            // TABLE HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Interest kind',
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Deposit',
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      textAlign: TextAlign.center,

                      'Rate',
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            // TABLE ROW
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rates.length,
              separatorBuilder: (context, index) => Divider(
                height: 32,
                thickness: 1,
                color: AppColors.neutral5,
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) {
                final item = rates[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      // INTEREST KIND
                      Expanded(
                        flex: 3,
                        child: Text(
                          item.kind,
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                      ),
                      // DEPOSIT
                      Expanded(
                        flex: 1,
                        child: Text(
                          textAlign: TextAlign.center,
                          item.deposit,
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                      ),
                      // RATE
                      Expanded(
                        flex: 1,
                        child: Text(
                          textAlign: TextAlign.center,
                          item.rate,
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.primary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.neutral1,
              size: 16,
            ),
            padding: EdgeInsets.zero,
          ),
          Text(
            'Interest rate',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
