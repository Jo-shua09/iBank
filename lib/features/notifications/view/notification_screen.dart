import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
              Text(
                'Messages',
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
                        'Bank of America',
                        'Your account statement for October is ready to view',
                        Icons.account_balance,
                        AppColors.primary1,
                      ),
                      const SizedBox(height: 12),
                      _listBuilder(
                        context,
                        'Security Alert',
                        'New login detected from a Chrome browser on Windows',
                        Icons.security,
                        Colors.orange,
                      ),
                      const SizedBox(height: 12),
                      _listBuilder(
                        context,
                        'Payment Received',
                        'You received \$1,200.00 from John Doe',
                        Icons.account_balance_wallet,
                        Colors.green,
                      ),
                      const SizedBox(height: 12),
                      _listBuilder(
                        context,
                        'Card Blocked',
                        'Your Visa card ending in 4242 has been temporarily blocked',
                        Icons.credit_card_off,
                        Colors.red,
                      ),
                      const SizedBox(height: 12),
                      _listBuilder(
                        context,
                        'System Update',
                        'iBank will be undergoing maintenance tonight at 12 AM',
                        Icons.system_update,
                        AppColors.neutral2,
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
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppEffects.dropShadowCard,
      ),
      child: ListTile(
        leading: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: AppColors.white),
        ),
        title: Text(
          title,
          style: AppTextStyles.body3.copyWith(color: AppColors.neutral1),
        ),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.caption1.copyWith(
            color: AppColors.neutral2,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(DateTime.now().toString().substring(11, 16)),
      ),
    );
  }
}
