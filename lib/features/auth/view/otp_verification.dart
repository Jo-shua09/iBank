import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _otpController = TextEditingController();
  bool _isFieldActive = false;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(() {
      final isFieldActive = _otpController.text.isNotEmpty;
      setState(() => _isFieldActive = isFieldActive);
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
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
                      'Enter the code received',
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.neutral1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: AppColors.neutral4),
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
                        const SizedBox(width: 12),
                        Expanded(
                          child: ButtonWidget(
                            buttonText: 'Resend',
                            isActive: true,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'This code will expired 10 minutes after this message. If you don\'t get a message.',
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.neutral1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 20),
                    ButtonWidget(
                      isActive: _isFieldActive,
                      buttonText: 'Change Password',
                      onPressed: () => context.pushNamed('success'),
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
            'OTP Verification',
            style: AppTextStyles.body3.copyWith(color: AppColors.neutral1),
          ),
        ],
      ),
    );
  }
}
