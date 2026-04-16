import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:ibank/core/constants/app_styles.dart';
import 'package:ibank/core/widgets/button_widget.dart';
import 'package:ibank/core/widgets/text_field_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                        child: Image(
                          width: 150,
                          image: AssetImage('assets/images/auth-1.jpg'),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        hintText: 'example@email.com',
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 16),
                      TextFieldWidget(
                        hintText: '',
                        labelText: 'Password',
                        password: true,
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => context.goNamed('forgotpassword'),
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
                        isActive: false,
                        onPressed: () => context.goNamed('signup'),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Image(
                          width: 70,
                          image: AssetImage('assets/images/fingerprint.jpg'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Align(
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
                      ),
                    ],
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
