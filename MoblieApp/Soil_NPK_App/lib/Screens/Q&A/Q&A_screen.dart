import 'package:flutter/material.dart';
import 'package:soil_npk_app/NavBar.dart';
import 'package:soil_npk_app/Screens/Q&A/body.dart';

class QandAScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Q and A",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: NavBar(),
      body: QandA(),
    );
  }
}
