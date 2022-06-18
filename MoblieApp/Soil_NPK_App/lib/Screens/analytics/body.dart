import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/analytics/LineMain.dart';
import 'package:soil_npk_app/Screens/analytics/linechart.dart';
import 'package:soil_npk_app/Screens/analytics/title_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

int currentIndex = 0;

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            AppLocalizations.of(context)!.analytics,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              LineMain(),
            ],
          ),
        ),
      );
}
