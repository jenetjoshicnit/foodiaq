import 'package:flutter/material.dart';
import 'package:foodiq/core/features/Login/Login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel viewModel = LoginViewModel();
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Container(
                            width: screenWidth * 0.25,
                            height: screenWidth * 0.25,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/foodiaqlogo.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.06),
                          child: TextFormField(
                            controller: viewModel.emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Email or Phone",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(133, 140, 131, 0.9),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33),
                              ),
                            ),
                            validator: viewModel.validateEmailOrPhone,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.057),
                          child: TextFormField(
                            controller: viewModel.passwordController,
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(133, 140, 131, 0.9),
                              ),
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
                          padding: EdgeInsets.only(top: screenHeight * 0.04),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password ?",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => LoginWithOTPView(),
                                  //   ),
                                  // );
                                },
                                child: Text(
                                  "Login with OTP",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.03),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5CB85C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(33),
                              ),
                              minimumSize: Size(
                                double.infinity,
                                screenHeight * 0.07,
                              ),
                            ),
                            onPressed: () {
                              if (viewModel.login()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login Successful')),
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
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5CB85C),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.25,
                  vertical: screenHeight * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
              ),

              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
