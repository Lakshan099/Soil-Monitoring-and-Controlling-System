import 'package:flutter/material.dart';
import 'package:soil_npk_app/NavBar.dart';
import 'package:soil_npk_app/Screens/Setting/body.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: Body(),
    );
  }
}
