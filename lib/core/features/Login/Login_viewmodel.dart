import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or phone';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value) &&
        !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid email or 10-digit phone';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool login() {
    if (formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }
}
