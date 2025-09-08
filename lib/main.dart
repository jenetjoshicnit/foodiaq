import 'package:flutter/material.dart';
import 'package:foodiq/core/features/Dashboard/Dashboard_view.dart';
import 'package:foodiq/core/features/Login/Login_view.dart';
import 'package:foodiq/core/features/NewPassword/Newpasswordpage_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodDashboard(),
    );
  }
}
