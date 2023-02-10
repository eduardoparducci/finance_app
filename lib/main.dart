import 'package:flutter/material.dart';
import 'config/app_styles.dart';
import 'components/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Finances',
      theme: ThemeData(
        primaryColor: Styles.primary
      ),
      home: const BottomBar(),
    );
  }
}