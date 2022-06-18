import 'package:flutter/material.dart';
import 'package:soil_npk_app/NavBar.dart';
import 'package:soil_npk_app/Screens/analytics/LineMain.dart';
import 'package:soil_npk_app/Screens/analytics/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          AppLocalizations.of(context)!.analytics,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: NavBar(),
      body:   Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              LineMain(),
            ],
          ),
        ),
    );
  }
}
