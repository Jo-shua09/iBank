import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // Ensure the status bar icons are white on every build
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: AppColors.white, // Match the bottom section
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeTab(),
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

  Widget _buildHomeTab() {
    return Column(
      children: [
        // --- TOP BLUE SECTION (COVERING STATUS BAR) ---
        Container(
          width: double.infinity,
          color: AppColors.primary1,
          child: Column(
            children: [
              // This pushes content below the notch while keeping background blue
              SizedBox(height: MediaQuery.of(context).padding.top),
              _topBarWidget(context),
              const SizedBox(height: 16),
            ],
          ),
        ),

        // --- WHITE BODY SECTION ---
        Expanded(
          child: Container(
            // Use a Stack to maintain the blue background color behind the rounded corners
            color: AppColors.primary1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                      padding: const EdgeInsets.only(bottom: 32),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: menuItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.85,
                          ),
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return _buildMenuItem(item);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(Map<String, String> item) {
    return GestureDetector(
      onTap: () {},
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
            const SizedBox(height: 8),
            Text(
              item['title']!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption1.copyWith(
                color: AppColors.neutral2,
                fontWeight: FontWeight.w400,
                fontSize: 11,
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white24,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=john'),
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
