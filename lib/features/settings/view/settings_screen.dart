import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primary1,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Settings',
              style: AppTextStyles.body1.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ), // Space for the overlapping image
                        Text(
                          'John Doe',
                          style: AppTextStyles.body1.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 30),

                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              _buildSettingItem(
                                title: 'Password',
                                hasArrow: true,
                              ),
                              _buildSettingItem(
                                title: 'Touch ID',
                                hasArrow: true,
                              ),
                              _buildSettingItem(
                                title: 'Languages',
                                hasArrow: true,
                              ),
                              _buildSettingItem(
                                title: 'App information',
                                hasArrow: true,
                              ),
                              _buildSettingItem(
                                title: 'Customer care',
                                trailingText: '19008989',
                                hasArrow: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // THE PROFILE IMAGE OVERLAP
                  Positioned(
                    top: 0,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    String? trailingText,
    bool hasArrow = true,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.neutral5, width: 0.8),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: AppTextStyles.body3.copyWith(
            color: AppColors.neutral2,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: trailingText != null
            ? Text(trailingText, style: AppTextStyles.caption1)
            : hasArrow
            ? const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.neutral4,
              )
            : null,
        onTap: () {},
      ),
    );
  }
}
