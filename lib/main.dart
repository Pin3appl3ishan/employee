import 'package:employee/themes/theme_data.dart';
import 'package:employee/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const HomePage(),
    );
  }
}
