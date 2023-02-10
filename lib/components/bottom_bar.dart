import 'package:flutter/material.dart';
import 'package:home_finances/screens/expenses.dart';
import 'package:home_finances/screens/home.dart';

import '../config/app_styles.dart';

class BottomBar extends StatefulWidget {

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarBuilder();
}

class _BottomBarBuilder extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Text("Categorias"),
    const Text("Meios de pagamento"),
    const ExpensesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Styles.primary,
          unselectedItemColor: Styles.disabled,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Categorias'),
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: 'Meios de Pagamento'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Histórico de despesas')
        ]


      ),
    );
  }
}