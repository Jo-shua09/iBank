import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/features/auth/controllers/sign_in_controller.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final SignInController _signInController;

  @override
  void initState() {
    super.initState();
    _signInController = SignInController();
    _signInController.addListener(() {
      setState(() {}); // Rebuilds the widget when controller notifies changes
    });
  }

  @override
  void dispose() {
    _signInController.dispose();
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
            _topBarWidget(context),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
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
                          'Welcome Back',
                          style: AppTextStyles.title2.copyWith(
                            color: AppColors.primary1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Hello there, sign in to continue',
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.neutral1,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Image.asset(
                            'assets/images/auth-1.jpg',
                            width: 150,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFieldWidget(
                          controller: _signInController.emailController,
                          hintText: 'example@email.com',
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          controller: _signInController.passwordController,
                          hintText: '',
                          labelText: 'Password',
                          password: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () =>
                                context.pushNamed('forgotpassword'),
                            child: Text(
                              'Forgot Password?',
                              style: AppTextStyles.caption1.copyWith(
                                color: AppColors.neutral1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonWidget(
                          buttonText: 'Sign In',
                          isActive: _signInController.isButtonActive,
                          onPressed: () => _signInController.home(context),
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: Image.asset(
                            'assets/images/fingerprint.jpg',
                            width: 70,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: AppTextStyles.caption1.copyWith(
                                  color: AppColors.neutral1,
                                ),
                              ),
                              TextButton(
                                onPressed: () => context.pushNamed('signup'),
                                child: Text(
                                  'Sign up',
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
            'Sign In',
            style: AppTextStyles.body3.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
