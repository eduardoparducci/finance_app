import 'package:flutter/material.dart';
import '../components/sources_dashboard.dart';
import '../components/title_bar.dart';
import '../config/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Styles.background,
      body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: const [
                  TitleBar(title: 'Aplicativo Financeiro', subtitle: 'Bem Vindo!', iconName: 'attach_money'),
                  SizedBox(height: 40),
                  SourcesDashboard()
                ])
            )
      ])
    );
  }
}