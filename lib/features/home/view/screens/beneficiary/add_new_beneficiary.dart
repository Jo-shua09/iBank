import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';
import 'package:ibank/core/widgets/top_bar_widget.dart';
import 'package:ibank/core/utils/effects.dart';

class AddNewBeneficiary extends StatefulWidget {
  const AddNewBeneficiary({super.key});

  @override
  State<AddNewBeneficiary> createState() => _AddNewBeneficiaryState();
}

class _AddNewBeneficiaryState extends State<AddNewBeneficiary> {
  String? _selectedBank;
  String? _selectedBranch;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final List<Map<String, dynamic>> tabs = [
      {
        'text': 'Transfer via card number',
        'icon': const Icon(Icons.credit_card, size: 20),
      },
      {
        'text': 'Transfer to same bank',
        'icon': const Icon(Icons.account_balance, size: 20),
      },
      {
        'text': 'Transfer to another bank',
        'icon': const Icon(Icons.swap_horiz, size: 20),
      },
    ];

    const String name = '';

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          const TopBarWidget(title: 'Add New'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.neutral5,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: AppColors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                // TODO: Implement image picker
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: AppColors.primary1,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        name,
                        style: AppTextStyles.body2.copyWith(
                          color: AppColors.primary1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        children: [
                          ...List.generate(tabs.length, (index) {
                            final bool isCurrentSelected =
                                index == _selectedIndex;
                            return GestureDetector(
                              onTap: () => setState(() {
                                _selectedIndex = index;
                              }),
                              child: Container(
                                width: 120,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                margin: const EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  color: isCurrentSelected
                                      ? AppColors.primary1
                                      : AppColors.neutral5,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      (tabs[index]['icon'] as Icon).icon,
                                      color: isCurrentSelected
                                          ? AppColors.white
                                          : AppColors.white,
                                      size: 24,
                                    ),
                                    const SizedBox(height: 6),
                                    Expanded(
                                      child: Text(
                                        tabs[index]['text'] as String,
                                        style: AppTextStyles.caption2.copyWith(
                                          color: isCurrentSelected
                                              ? AppColors.white
                                              : AppColors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
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
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: AppEffects.dropShadowCard,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose bank",
                            style: AppTextStyles.body3.copyWith(
                              color: AppColors.neutral1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          _buildSelectionInput(
                            hintText: 'Choose bank',
                            selectedText: _selectedBank,
                            onTap: () async {
                              final result = await _showSelectionDialog(
                                context,
                                'Choose bank',
                                [
                                  'Citibank',
                                  'Bank of America',
                                  'Chase',
                                  'Wells Fargo',
                                  'HSBC',
                                ],
                              );
                              if (result != null) {
                                setState(() {
                                  _selectedBank = result;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Choose branch',
                            style: AppTextStyles.body3.copyWith(
                              color: AppColors.neutral1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          _buildSelectionInput(
                            hintText: 'Choose bank branch',
                            selectedText: _selectedBranch,
                            onTap: () async {
                              final result = await _showSelectionDialog(
                                context,
                                'Choose bank branch',
                                [
                                  'New York',
                                  'Los Angeles',
                                  'Chicago',
                                  'Houston',
                                  'Phoenix',
                                ],
                              );
                              if (result != null) {
                                setState(() {
                                  _selectedBranch = result;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFieldWidget(
                            hintText: "",
                            labelText: "Transaction name",
                          ),
                          const SizedBox(height: 16),
                          TextFieldWidget(
                            hintText: "",
                            labelText: "Card number",
                          ),
                          const SizedBox(height: 32),
                          ButtonWidget(
                            buttonText: 'Add Beneficiary',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionInput({
    required String hintText,
    String? selectedText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.neutral4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedText ?? hintText,
                style: AppTextStyles.caption2.copyWith(
                  color: selectedText != null
                      ? AppColors.neutral1
                      : AppColors.neutral3,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.neutral3),
          ],
        ),
      ),
    );
  }

  Future<String?> _showSelectionDialog(
    BuildContext context,
    String title,
    List<String> options,
  ) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            title,
            style: AppTextStyles.body2.copyWith(color: AppColors.neutral1),
            textAlign: TextAlign.center,
          ),
          children: options.map((option) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, option);
              },
              child: Text(
                option,
                textAlign: TextAlign.center,
                style: AppTextStyles.body3.copyWith(color: AppColors.neutral2),
              ),
            );
          }).toList(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
        );
      },
    );
  }
}
