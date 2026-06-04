import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';
import 'package:ibank/core/widgets/button_widget.dart';

class MobilePrepaid extends StatefulWidget {
  const MobilePrepaid({super.key});

  @override
  State<MobilePrepaid> createState() => _MobilePrepaidState();
}

class _MobilePrepaidState extends State<MobilePrepaid> {
  int selectedIndex = 0;
  String? selectedAccountName;
  String? selectedAccountBalance;
  IconData? selectedAccountIcon;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _topBarWidget(context),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose the account/card ',
                    style: AppTextStyles.body3.copyWith(
                      color: AppColors.neutral1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () async {
                      final result = await showDialog<Map<String, dynamic>>(
                        context: context,
                        builder: (context) => _selectAccountDialog(context),
                      );
                      if (result != null) {
                        setState(() {
                          selectedAccountName = result['name'];
                          selectedAccountBalance = result['balance'];
                          selectedAccountIcon = result['icon'];
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.neutral4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            selectedAccountIcon ?? Icons.account_balance_wallet,
                            color: AppColors.primary1,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              selectedAccountName ?? 'Choose account/card',
                              style: AppTextStyles.caption2.copyWith(
                                color: selectedAccountName != null
                                    ? AppColors.neutral1
                                    : AppColors.neutral4,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (selectedAccountBalance != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              selectedAccountBalance!,
                              style: AppTextStyles.caption2.copyWith(
                                color: AppColors.primary1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.neutral3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Directory',
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.neutral1,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Find beneficiary',
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.primary1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: AppEffects.dropShadowCardSmall,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.neutral5,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppColors.neutral3,
                                size: 20,
                              ),
                            ),
                          ),
                        ),

                        ...List.generate(5, (index) {
                          final bool isCurrentSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;
                            }),
                            child: Container(
                              width: 100,
                              margin: const EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                color: isCurrentSelected
                                    ? AppColors.primary1
                                    : AppColors.white,
                                boxShadow: AppEffects.dropShadowCardSmall,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: isCurrentSelected
                                        ? AppColors.white.withOpacity(0.2)
                                        : AppColors.neutral5,
                                    child: Icon(
                                      Icons.person,
                                      color: isCurrentSelected
                                          ? AppColors.white
                                          : AppColors.neutral3,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    index == 0
                                        ? 'John Doe'
                                        : 'User ${index + 1}',
                                    style: AppTextStyles.caption2.copyWith(
                                      color: isCurrentSelected
                                          ? AppColors.white
                                          : AppColors.neutral3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Phone number',
                    style: AppTextStyles.body3.copyWith(
                      color: AppColors.neutral1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.neutral4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral1),
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
                  const SizedBox(height: 16),
                  Text(
                    'Enter amount',
                    style: AppTextStyles.body3.copyWith(
                      color: AppColors.neutral1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.neutral4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.neutral1),
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
                  const Spacer(),
                  ButtonWidget(
                    buttonText: 'Confirm',
                    isActive: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 42),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.neutral1,
              size: 16,
            ),
          ),
          Text(
            'Mobile Prepaid',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }

  Widget _selectAccountDialog(BuildContext context) {
    final accounts = [
      {
        'name': 'Main Account (...1234)',
        'balance': '\$12,000.00',
        'icon': Icons.account_balance,
      },
      {
        'name': 'Visa Card (...5678)',
        'balance': '\$8,500.00',
        'icon': Icons.credit_card,
      },
    ];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Select account/card',
                style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
              ),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: accounts.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: AppColors.neutral5, height: 1),
              itemBuilder: (context, index) {
                final account = accounts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, account);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Icon(
                          account['icon'] as IconData,
                          color: AppColors.primary1,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            account['name'] as String,
                            style: AppTextStyles.body3.copyWith(
                              color: AppColors.neutral1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          account['balance'] as String,
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.primary1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
