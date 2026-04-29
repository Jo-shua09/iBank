import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/data/dummy_data.dart';

class ExchangeRateScreen extends StatelessWidget {
  const ExchangeRateScreen({super.key});

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
                      'Country',
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Buy',
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Sell',
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
            Expanded(
              child: ListView.separated(
                itemCount: exchangeRates.length,
                separatorBuilder: (context, index) => Divider(
                  height: 32,
                  thickness: 1,
                  color: AppColors.neutral5,
                  indent: 20,
                  endIndent: 20,
                ),
                itemBuilder: (context, index) {
                  final item = exchangeRates[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // COUNTRY AND FLAG
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Text(
                                item.countryCode,
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item.country,
                                  style: AppTextStyles.body3.copyWith(
                                    color: AppColors.neutral1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // BUY
                        Expanded(
                          flex: 1,
                          child: Text(
                            textAlign: TextAlign.center,
                            item.buy,
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.neutral1,
                            ),
                          ),
                        ),
                        // SELL
                        Expanded(
                          flex: 1,
                          child: Text(
                            textAlign: TextAlign.center,
                            item.sell,
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
            'Exchange rate',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
