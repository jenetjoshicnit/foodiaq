import 'package:flutter/material.dart';

class NewPasswordViewModel {
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 8) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != newPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  bool resetPassword() {
    if (formKey.currentState!.validate()) {
      debugPrint("Password Reset Successful!");
      debugPrint("New Password: ${newPasswordController.text}");
      return true;
    }
    return false;
  }
}
