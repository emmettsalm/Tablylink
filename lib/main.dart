import 'package:flutter/material.dart';
import 'package:tablylink/screens/login_screen.dart';
import 'package:tablylink/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tablylink',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false ,
      home: LoginScreen(),
    );
  }
}
