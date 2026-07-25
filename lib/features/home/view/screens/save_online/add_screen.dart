import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/selection_input_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';

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
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                              if (pickedTime != null) {
                                setState(() {
                                  _selectedTimeDeposit =
                                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year} ${pickedTime.format(context)}";
                                });
                              }
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
                        ButtonWidget(buttonText: 'Verify', onPressed: () {}),
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
