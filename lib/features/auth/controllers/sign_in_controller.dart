import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isButtonActive = false;
  bool get isButtonActive => _isButtonActive;

  SignInController() {
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    final emailFilled = emailController.text.isNotEmpty;
    final passwordFilled = passwordController.text.isNotEmpty;

    final newIsButtonActive = emailFilled && passwordFilled;
    if (_isButtonActive != newIsButtonActive) {
      _isButtonActive = newIsButtonActive;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // You can add your sign-in logic here
  void home(BuildContext context) {
    if (_isButtonActive) {
      // Perform sign-in, e.g., call an authentication service
      context.goNamed('home');
      print('success');
    }
  }
}
