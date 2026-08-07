import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';
import 'package:ibank/features/home/view/screens/common/successful_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String? _selectedAccountCard;
  String? _selectedTimeDeposit;
  final TextEditingController _amountController = TextEditingController();

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/add_screen.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 32.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: AppEffects.dropShadowCard,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSelectionInput(
                          hintText: 'Choose account/card',
                          selectedText: _selectedAccountCard,
                          onTap: () async {
                            final result = await context.pushNamed(
                              'choose-card',
                            );
                            if (result != null && result is Map) {
                              setState(() {
                                _selectedAccountCard =
                                    result['name'] as String?;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildSelectionInput(
                          hintText: 'Choose time deposit',
                          selectedText: _selectedTimeDeposit,
                          onTap: () async {
                            final result = await _showTimeDepositDialog();
                            if (result != null) {
                              setState(() {
                                _selectedTimeDeposit = result;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          hintText: 'Amount (At least \$1000)',
                          labelText: 'Amount',
                          keyboardType: TextInputType.phone,
                          controller: _amountController,
                        ),
                        const SizedBox(height: 24),
                        ButtonWidget(
                          buttonText: 'Verify',
                          isActive: true,
                          onPressed: () => context.pushNamed(
                            'success',
                            extra: SuccessfulScreen(
                              imagePath: 'assets/images/add_screen.jpg',
                              text: 'Save online Successful!',
                              description:
                                  'Congratulations! You have successfully saved online. Thank you for using iBank.',
                              buttonText: 'Go to Home',
                            ),
                          ),
                        ),
                      ],
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
            'Add',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }

  Future<String?> _showTimeDepositDialog() {
    final timeOfDeposit = [
      "3 months (interest rate 4%)",
      "6 months (interest rate 4.5%)",
      "12 months (interest rate 5%)",
      "16 months (interest rate 5.5%)",
      "24 months (interest rate 6%)",
    ];

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Choose time deposit',
            style: AppTextStyles.body2.copyWith(color: AppColors.neutral1),
          ),
          children: timeOfDeposit.map((option) {
            final isSelected = _selectedTimeDeposit == option;
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, option);
              },
              child: Text(
                option,
                style: AppTextStyles.body3.copyWith(
                  color: isSelected ? AppColors.primary1 : AppColors.neutral2,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
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

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
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
          ],
        ),
      ),
    );
  }
}
