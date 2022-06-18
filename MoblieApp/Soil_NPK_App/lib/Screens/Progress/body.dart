import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Progress/background.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class StatefullWidgetDemo extends StatefulWidget {
  @override
  _StatefulWidgetDemoState createState() {
    return new _StatefulWidgetDemoState();
  }
}

class _StatefulWidgetDemoState extends State<StatefullWidgetDemo> {
  String _Sval = "";
  String _Hval = "";

  initState() {
    getSMvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Progress'),
      ),
      body: new SingleChildScrollView(
        padding: new EdgeInsets.all(8.0),
        child: new Text(
          "Soil M Value: " + _Sval,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.0,
          ),
        ),
      ),
    );
  }

  Future<void> getSMvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/soilM');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _Sval = data;
      });
    });
  }
}
