import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/custom_icon_widget.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({super.key});

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
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 500,
                    color: AppColors.primary1,
                    child: Text('Map Integration coming soon'),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.5, // Starts at 40% height
                    minChildSize: 0.2, // Can shrink to 20%
                    maxChildSize: 0.9, // Can expand to 90%
                    builder: (context, scrollController) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(28),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Handle Bar
                            const SizedBox(height: 12),
                            Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: AppColors.neutral5,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Search Bar
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      8,
                                      4,
                                      0,
                                      0,
                                    ),
                                    child: CustomIconWidget(
                                      iconPath: 'search.svg',
                                      size: 20,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: AppColors.neutral4,
                                  ),
                                  hintText: 'Bank',
                                  hintStyle: AppTextStyles.body3.copyWith(
                                    color: AppColors.neutral1,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.neutral1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.primary1,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.semanticRed,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),

                            // 3. THE BRANCH LIST
                            Expanded(
                              child: ListView.separated(
                                controller: scrollController,
                                padding: const EdgeInsets.all(20),
                                itemCount: 5,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 32),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: AppColors.primary1,
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          "Bank 1656 Union Street",
                                          style: AppTextStyles.body3.copyWith(
                                            color: AppColors.neutral1,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "50 m",
                                        style: AppTextStyles.caption2.copyWith(
                                          color: AppColors.neutral2,
                                        ),
                                      ),
                                    ],
                                  );
                                },
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
            'Branch',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
