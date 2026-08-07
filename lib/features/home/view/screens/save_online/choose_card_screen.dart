import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/top_bar_widget.dart';

class ChooseCardScreen extends StatelessWidget {
  const ChooseCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final accounts = [
      {
        'name': 'Main Account (...1234)',
        'balance': '\$3,469.52',
        'image': 'assets/images/blue-card.jpg',
        'type': 'blueCard',
      },
      {
        'name': 'Visa Card (...5678)',
        'balance': '\$3,469.52',
        'image': 'assets/images/gold-card.jpg',
        'type': 'goldCard',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(
            height: statusBarHeight,
          ), // This is for the status bar padding
          const TopBarWidget(title: 'Choose card'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      return GestureDetector(
                        onTap: () {
                          context.pop(account);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              account['image'] as String,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            if (index < accounts.length - 1)
                              const SizedBox(height: 16),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => context.pushNamed('add'),
                    child: DottedBorder(
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Add new card',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.neutral3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
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
}
