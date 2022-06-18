import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soil_npk_app/Screens/Login/login_screen.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/Screens/SoilM/background.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:soil_npk_app/components/QRcode.dart';
import 'package:soil_npk_app/components/notificationAPI.dart';
import 'package:soil_npk_app/components/notificationLocation.dart';
import 'dart:async';

import 'package:soil_npk_app/components/proSqButton.dart';
import 'package:soil_npk_app/main_screen.dart';

class Body extends StatefulWidget {
  @override
  _StatefulWidgetState createState() {
    return new _StatefulWidgetState();
  }
}

class _StatefulWidgetState extends State<Body> {
  String _Sval = "";
  String _Hval = "";

  initState() {
    getSMvalue();
    chkMvalue();
    super.initState();
    NotificationService().requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 72, 72, 72),
                      width: 5.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 72, 72, 72),
                ),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Image.asset(
                "assets/images/meter.png",
                height: size.height * 0.2,
                width: size.width * 0.2,
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 72, 72, 72),
                      width: 5.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 72, 72, 72),
                ),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 330),
              child: Text(
                "Moisturizing",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 390),
              child: Text(
                _Sval + "%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
                padding: EdgeInsets.only(top: 560),
                child: proSqButton(
                  text: "Back",
                  press: () {
                    Back(context);
                  },
                )),
          ]),
        ],
      ),
    );
  }

   Future<void> chkMvalue() async {
    var Pval = int.parse(_Sval);
    if (Pval < 10) {
      ShowNotification(
          id: 0, title: "Soil Moisturizing", body: "Soil water level is getting low");

      ShowNotification(
          id: 1, title: "Soil Moisturizing", body: "Turn on the Solenoid valve");

      LoginScreen.twilioFlutter.sendSMS(
          toNumber: LoginScreen.loggedcontat!,
          messageBody: "Soil water level is getting low\nTurn on the Solenoid valve");    
    }
  }

  Future<void> getSMvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/' + ScanQrPage.deviceId! + '/SensorValue/soilM');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _Sval = data;
        chkMvalue();
      });
    });
  }

  void Back(BuildContext context) {
    MainScreen.pageIndex = 1;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }
}
