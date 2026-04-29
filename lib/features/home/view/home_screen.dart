import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for status bar styling
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';
import 'package:ibank/core/widgets/custom_icon_widget.dart';
import 'package:ibank/core/widgets/bottom_navigation_widget.dart';
import 'package:ibank/features/search/view/search_screen.dart';
import 'package:ibank/features/notifications/view/notification_screen.dart';
import 'package:ibank/features/settings/view/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> menuItems = [
    {'title': 'Account and Card', 'icon': 'card.svg'},
    {'title': 'Transfer', 'icon': 'transfer.svg'},
    {'title': 'Withdraw', 'icon': 'withdraw.svg'},
    {'title': 'Mobile prepaid', 'icon': 'prepaid.svg'},
    {'title': 'Pay Bills', 'icon': 'bill.svg'},
    {'title': 'Save online', 'icon': 'save.svg'},
    {'title': 'Credit card', 'icon': 'credit.svg'},
    {'title': 'Transaction report', 'icon': 'report.svg'},
    {'title': 'Beneficiary', 'icon': 'beneficiary.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    // This makes the status bar text/icons white
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // For Android
        statusBarBrightness: Brightness.dark, // For iOS
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primary1, // Ensures the background is blue
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // HOME TAB
          Column(
            children: [
              // TOP BLUE SECTION - This now covers the status bar area
              Container(
                color: AppColors.primary1,
                child: SafeArea(
                  bottom:
                      false, 
                  child: _topBarWidget(context),
                ),
              ),
              const SizedBox(height: 16),
              // WHITE BODY SECTION
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/stack-cards.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 32),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: menuItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 0,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (context, index) {
                            final item = menuItems[index];
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: AppEffects.dropShadowCard,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconWidget(iconPath: item['icon']!),
                                      const SizedBox(height: 12),
                                      Text(
                                        item['title']!,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.caption1.copyWith(
                                          color: AppColors.neutral2,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SearchScreen(),
          const NotificationScreen(),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _topBarWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: const BoxDecoration(color: AppColors.primary1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white24, // Subtle placeholder
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=john'),
            ),
          ),
          const SizedBox(width: 12),
          RichText(
            text: TextSpan(
              style: AppTextStyles.caption1.copyWith(
                color: AppColors.white.withOpacity(0.8),
              ),
              children: [
                TextSpan(
                  text: 'Hi, ',
                  style: AppTextStyles.body3.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'John',
                  style: AppTextStyles.body3.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
