import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/analytics/linechart.dart';
import 'package:soil_npk_app/Screens/analytics/title_data.dart';

int currentIndex = 0;

class LineMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: Color(0xff232d37),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: LineChartPage(),
        ),
      );
}
