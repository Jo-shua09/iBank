import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  bool _isFieldActive = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      final isFieldActive = _emailController.text.isNotEmpty;
      setState(() => _isFieldActive = isFieldActive);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                // border: Border.all(color: AppColors.neutral1),
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.neutral5,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your email to reset your password',
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.neutral1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      controller: _emailController,
                      hintText: 'example@email.com',
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      isActive: _isFieldActive,
                      buttonText: 'Send',
                      onPressed: () => context.pushNamed('otp'),
                    ),
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
            'Forgot Password',
            style: AppTextStyles.body3.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
