import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/utils/effects.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

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
            const SizedBox(height: 16),
            Image(
              width: 300,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/illustration-5.jpg'),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                // border: Border.all(color: AppColors.neutral1),
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: AppEffects.dropShadowCard,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _inputTextField('From', 'USD'),
                    const SizedBox(height: 16),
                    Center(
                      child: Icon(
                        Icons.swap_vert,
                        color: AppColors.primary1,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _inputTextField('To', 'IDR'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Currency rate',
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.primary1,
                          ),
                        ),
                        Text(
                          '1 USD = 15,000 IDR',
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    ButtonWidget(buttonText: 'Exchange', onPressed: () {}),
                  ],
                ),
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
            'Exchange rate',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }

  Widget _inputTextField(String labeltext, String currency) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labeltext,
          style: AppTextStyles.body3.copyWith(color: AppColors.neutral1),
        ),
        const SizedBox(height: 4),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixIcon: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalDivider(
                    color: AppColors.neutral4,
                    thickness: 1,
                    width: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          currency,
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                        const Icon(
                          Icons.unfold_more_outlined,
                          size: 20,
                          color: AppColors.neutral3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            hintStyle: TextStyle(color: AppColors.neutral4),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutral5),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutral1, width: 1.5),
              borderRadius: BorderRadius.circular(16),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.semanticRed, width: 1.5),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
