import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';

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
                      _ListBuilder(
                        'Branch',
                        'Search for Branch near you',
                        'assets/images/branch.jpg',
                      ),
                      const SizedBox(height: 16.0),
                      _ListBuilder(
                        'Interest rate',
                        'Search for interest rate',
                        'assets/images/interest.jpg',
                      ),
                      const SizedBox(height: 16.0),
                      _ListBuilder(
                        'Exchange rate',
                        'Search for exchange rate',
                        'assets/images/exchange-rate.jpg',
                      ),
                      const SizedBox(height: 16.0),
                      _ListBuilder(
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

  Widget _ListBuilder(String title, String subtitle, String imageUrl) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
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
          // Handle search result tap
        },
      ),
    );
  }
}
