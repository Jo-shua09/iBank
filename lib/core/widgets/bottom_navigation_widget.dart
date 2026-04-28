import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/custom_icon_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 30,
              spreadRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon('home.svg', currentIndex == 0, 'Home'),
                activeIcon: _buildIcon('home.svg', currentIndex == 0, 'Home'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon('search.svg', currentIndex == 1, 'Search'),
                activeIcon: _buildIcon(
                  'search.svg',
                  currentIndex == 1,
                  'Search',
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  'notification.svg',
                  currentIndex == 2,
                  'Notifications',
                ),
                activeIcon: _buildIcon(
                  'notification.svg',
                  currentIndex == 2,
                  'Notifications',
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon('settings.svg', currentIndex == 3, 'Settings'),
                activeIcon: _buildIcon(
                  'settings.svg',
                  currentIndex == 3,
                  'Settings',
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String iconPath, bool isActive, String label) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
        horizontal: isActive ? 12.0 : 8.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary1 : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.white : AppColors.neutral2,
              BlendMode.srcIn,
            ),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CustomIconWidget(iconPath: iconPath),
            ),
          ),
          if (isActive)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  label,
                  style: AppTextStyles.caption1.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
