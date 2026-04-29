import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/features/auth/controllers/sign_up_controller.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final SignUpController _signUpController;

  @override
  void initState() {
    super.initState();
    _signUpController = SignUpController();
    _signUpController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _signUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primary1,
        child: Column(
          children: [
            SizedBox(height: statusBarHeight),
            _topBarWidget(context),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 30.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to us,',
                          style: AppTextStyles.title2.copyWith(
                            color: AppColors.primary1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Hello there, create New account',
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Image.asset(
                            'assets/images/auth-2.jpg',
                            width: 150,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFieldWidget(
                          controller: _signUpController.fullNameController,
                          hintText: 'John Doe',
                          labelText: 'Full Name',
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          controller: _signUpController.emailController,
                          hintText: 'example@email.com',
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          controller: _signUpController.passwordController,
                          hintText: '••••••••',
                          labelText: 'Password',
                          password: true,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          controller:
                              _signUpController.confirmPasswordController,
                          labelText: 'Confirm Password',
                          password: true,
                          hintText: '••••••••',
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Checkbox.adaptive(
                              activeColor: AppColors.primary1,
                              value: _signUpController.isChecked,
                              onChanged: (bool? value) {
                                _signUpController.toggleCheckbox(value);
                              },
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'By creating an account your agree to our ',
                                      style: AppTextStyles.caption1.copyWith(
                                        color: AppColors.neutral1,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: AppTextStyles.caption1.copyWith(
                                        color: AppColors.primary1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ButtonWidget(
                          buttonText: 'Sign Up',
                          isActive: _signUpController.isButtonActive,
                          onPressed: () => _signUpController.signUp(context),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an account?',
                                style: AppTextStyles.caption1.copyWith(
                                  color: AppColors.neutral1,
                                ),
                              ),
                              TextButton(
                                onPressed: () => context.goNamed('signin'),
                                child: Text(
                                  'Sign in',
                                  style: AppTextStyles.caption1.copyWith(
                                    color: AppColors.primary1,
                                    fontWeight: FontWeight.w500,
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
      height: 70,
      decoration: const BoxDecoration(color: AppColors.primary1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 16,
            ),
          ),
          Text(
            'Sign Up',
            style: AppTextStyles.body1.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
