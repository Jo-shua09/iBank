import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Search',
                style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _listBuilder(
                        context,
                        'Branch',
                        'Search for Branch near you',
                        'assets/images/branch.jpg',
                      ),
                      const SizedBox(height: 16.0),
                      _listBuilder(
                        context,
                        'Interest rate',
                        'Search for interest rate',
                        'assets/images/interest.jpg',
                      ),
                      const SizedBox(height: 16.0),
                      _listBuilder(
                        context,
                        'Exchange rate',
                        'Search for exchange rate',
                        'assets/images/exchange-rate.jpg',
                      ),
                      const SizedBox(height: 16.0),
                      _listBuilder(
                        context,
                        'Exchange',
                        'Search for exchange',
                        'assets/images/exchange.jpg',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
          context.push('/search/$title'.toLowerCase().replaceAll(' ', '-'));
        },
      ),
    );
  }
}
