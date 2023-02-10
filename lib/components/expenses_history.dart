import 'package:flutter/material.dart';
import 'package:home_finances/config/constants.dart';
import 'package:home_finances/models/category.dart';
import 'package:home_finances/models/expense.dart';
import 'package:home_finances/models/source.dart';
import '../config/app_styles.dart';

class ExpensesHistory extends StatefulWidget {

  const ExpensesHistory({super.key});

  @override
  ExpensesHistoryState createState() => ExpensesHistoryState();
}

class ExpensesHistoryState extends State<ExpensesHistory> {

  final _categories = <CategoryModel>[
    CategoryModel(id: 1, icon: 'shopping_cart', name: 'Supermercado', limit: 1500),
    CategoryModel(id: 2, icon: 'directions_car', name: 'Transporte', limit: 400)
  ];

  final _sources = <SourceModel>[
    SourceModel(id: 1, icon: 'qr_code', name: 'PIX', limit: 300.00, dueDate: DateTime(2023, 02, 08)),
    SourceModel(id: 2, icon: 'credit_card', name: 'Cartão de Crédito', limit: 500.00, dueDate: DateTime(2023, 02, 08))
  ];

  final _expenses = <ExpenseModel>[
    ExpenseModel(id: 1, categoryId: 1, sourceId: 2, price: 100.0,description: 'Compra Tauste', dueTo: '08/02/2023'),
    ExpenseModel(id: 2, categoryId: 2, sourceId: 1, price: 200.0,description: 'Manutenção Kwid', dueTo: '30/01/2023'),
    ExpenseModel(id: 3, categoryId: 2, sourceId: 2, price: 80.8,description: 'Combustível Leisa', dueTo: '20/01/2023'),
    ExpenseModel(id: 4, categoryId: 1, sourceId: 2, price: 163.5,description: 'Compra Confiança', dueTo: '12/01/2023')
  ];

  Widget _buildList() {
    return ListView.separated(
      itemCount: _expenses.length,
      itemBuilder: (BuildContext context, index) {
        return _buildRow(_expenses[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  Widget _buildRow(ExpenseModel expense) {

    return ListTile(
      leading: Icon(
          ICONS_MAP[_categories.firstWhere((cat) => cat.id==expense.categoryId).icon],
          color: Styles.dark
      ),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Expanded(
                flex: 7,
                child: Text(expense.description)
            ),
            Expanded(
                flex: 3,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(ICONS_MAP[_sources.firstWhere((s) => s.id==expense.sourceId).icon], size: 16),
                      const SizedBox(width: 8),
                      Text('R\$${expense.price}', style: Styles.subtitle1)
                    ]
                )
            ),
          ]
      ),
      subtitle: Text(expense.dueTo, style: Styles.subtitle2),
      trailing: const Icon(Icons.edit),
      onTap: () {
        setState(() {
          expense.isRecurrent = !expense.isRecurrent;
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.background,
        body: _buildList()
    );
  }

}