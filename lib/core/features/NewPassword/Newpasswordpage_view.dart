import 'package:flutter/material.dart';
import 'package:foodiq/core/features/NewPassword/Newpasswordpage_viewmodel.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final NewPasswordViewModel viewModel = NewPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF5CB85C), Color(0xFFFFFDFD)],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.04,
          ),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/foodiaqlogo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.04),
                  child: Text(
                    "Your password must be at-least 8 characters long.",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.08),
                  child: TextFormField(
                    controller: viewModel.newPasswordController,
                    obscureText: true,
                    style: TextStyle(color: Color.fromRGBO(133, 140, 131, 0.9)),
                    decoration: InputDecoration(
                      labelText: "Enter new password",
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                    ),
                    validator: viewModel.validatePassword,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.065),
                  child: TextFormField(
                    controller: viewModel.confirmPasswordController,
                    obscureText: true,
                    style: TextStyle(color: Color.fromRGBO(133, 140, 131, 0.9)),
                    decoration: InputDecoration(
                      labelText: "Reconfirm new password",
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                    ),
                    validator: viewModel.validateConfirmPassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.09),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5CB85C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                      minimumSize: Size(double.infinity, screenHeight * 0.07),
                    ),
                    onPressed: () {
                      if (viewModel.resetPassword()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Password Reset Successful')),
                        );
                      }
                    },
                    child: Text(
                      "Eat Away!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
