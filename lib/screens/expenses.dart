import 'package:flutter/material.dart';
import 'package:home_finances/components/expenses_history.dart';
import '../components/title_bar.dart';
import '../config/app_styles.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Styles.background,
        body: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                      children: [
                        const TitleBar(title: 'Histórico de despesas', iconName: 'account_balance'),
                        const SizedBox(height: 40),
                        SizedBox(
                            height: size.height,
                            width: size.height,
                            child: const ExpensesHistory()
                        )
                      ])
              )
            ])
    );
  }
}