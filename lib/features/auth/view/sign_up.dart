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
      setState(() {}); // Rebuilds the widget when controller notifies changes
    });
  }

  @override
  void dispose() {
    _signUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _topBarWidget(
              context,
            ), // Renamed from _topBarWidget to accept context
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                          child: Image(
                            width: 150,
                            image: AssetImage('assets/images/auth-2.jpg'),
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
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          controller: _signUpController.passwordController,
                          hintText: '',
                          labelText: 'Password',
                          password: true,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          controller:
                              _signUpController.confirmPasswordController,
                          hintText: '',
                          labelText: 'Confirm Password',
                          password: true,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Checkbox.adaptive(
                              activeColor: AppColors.primary1,
                              checkColor: AppColors.primary1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),

                              side: BorderSide(
                                width: .9,
                                color: AppColors.neutral4,
                              ),
                              value: _signUpController.isChecked,
                              onChanged: (bool? value) {
                                _signUpController.toggleCheckbox(value);
                              },
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: AppTextStyles.body2,
                                  children: [
                                    TextSpan(
                                      text:
                                          'By creating an account your aggree to our ',
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
                          onPressed: () => _signUpController.signUp(),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
      height: 50,
      decoration: BoxDecoration(color: AppColors.primary1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 16,
            ),
            padding: EdgeInsets.zero,
          ),
          Text(
            'Sign Up',
            style: AppTextStyles.body3.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
