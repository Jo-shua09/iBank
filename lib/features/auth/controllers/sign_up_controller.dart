import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isButtonActive = false;
  bool get isButtonActive => _isButtonActive;

  bool _isChecked = false;
  bool get isChecked => _isChecked;

  SignUpController() {
    fullNameController.addListener(_updateButtonState);
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
  }

  void toggleCheckbox(bool? value) {
    _isChecked = value ?? false;
    _updateButtonState();
    notifyListeners();
  }

  void _updateButtonState() {
    final allFieldsFilled =
        fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;

    final newIsButtonActive = allFieldsFilled && _isChecked;
    if (_isButtonActive != newIsButtonActive) {
      _isButtonActive = newIsButtonActive;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    fullNameController.removeListener(_updateButtonState);
    emailController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    confirmPasswordController.removeListener(_updateButtonState);

    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // You can add your sign-up logic here
  void signUp() {
    if (_isButtonActive) {
      // Perform sign-up, e.g., call an authentication service
      print('Success');
      // Add password matching validation here before proceeding
    }
  }
}
