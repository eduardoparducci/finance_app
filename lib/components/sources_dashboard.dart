import 'package:flutter/material.dart';
import 'package:home_finances/models/source.dart';
import 'package:pie_chart/pie_chart.dart';

import '../config/app_styles.dart';
import 'label_value_item.dart';

class SourcesDashboard extends StatefulWidget {
  const SourcesDashboard({Key? key}) : super(key: key);

  @override
  State<SourcesDashboard> createState() => _SourcesDashboardState();
}

class _SourcesDashboardState extends State<SourcesDashboard> {

  Map<String, double> dataMap = {
    "Cartão": 500.00,
    "PIX": 300.00
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        const ValuesReport(),
        SizedBox(width: MediaQuery.of(context).size.width / 2.4),
        PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartRadius: MediaQuery.of(context).size.width / 4,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 32,
          colorList: [Styles.dark, Colors.grey],
          legendOptions: const LegendOptions(showLegends: false),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: true,
            decimalPlaces: 2,
          ),
        )
      ]);
  }
}

class ValuesReport extends StatefulWidget {
  const ValuesReport({super.key});

  @override
  State<ValuesReport> createState() => _ValuesReportBuilder();
}

class _ValuesReportBuilder extends State<ValuesReport> {

  final SourceModel _total = SourceModel(
      id: 0,
      icon: 'paid',
      name: 'total',
      limit: 0,
      dueDate: DateTime(2023)
  );

  List<SourceModel> _sources = <SourceModel>[];

  List<Widget> _buildListView() {
    List<Widget> sourcesWidgets = <Widget>[];

    setState(() {
      _total.limit = 0;
      // Get from API
      _sources = [
        SourceModel(id: 1,
            icon: 'qr_code',
            name: 'Test',
            limit: 300.00,
            dueDate: DateTime(2023, 02, 08)),
        SourceModel(id: 1,
            icon: 'credit_card',
            name: 'Test 2',
            limit: 500.00,
            dueDate: DateTime(2023, 02, 08))
      ];

      for(SourceModel source in _sources) {
        LabelValueItem w = LabelValueItem(
            iconName: source.icon,
            iconColor: Styles.dark,
            label: source.limit.toString(),
            textStyle: Styles.title4);
        sourcesWidgets.add(w);
        _total.limit += source.limit;
      }
    });
    return sourcesWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Styles.dark))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildListView())
          ),
          const SizedBox(height: 10.0),
          LabelValueItem(
              iconName: _total.icon,
              iconColor: Styles.accent,
              label: _total.limit.toString(),
              textStyle: Styles.title3
          )
        ]);
  }
}