import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/Screens/Progress/background.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:soil_npk_app/components/notificationAPI.dart';
import 'package:soil_npk_app/components/notificationLocation.dart';
import 'dart:async';

import 'package:soil_npk_app/components/proSqButton.dart';
import 'package:soil_npk_app/main_screen.dart';

import '../../components/QRcode.dart';
import '../Login/login_screen.dart';

class Body extends StatefulWidget {
  @override
  _StatefulWidgetDemoState createState() {
    return new _StatefulWidgetDemoState();
  }
}

class _StatefulWidgetDemoState extends State<Body> {
  String _Hval = "";
  String _ETval = "";
  String _STval = "";

  initState() {
    getHvalue();
    getETvalue();
    getSTvalue();
    chkHvalue();
    chkSTvalue();
    chkTvalue();
    super.initState();
    NotificationService().requestPermission();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 30),
              child: Container(
                width: 150,
                height: 150,
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
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5, right: 30),
              child: Container(
                width: 150,
                height: 150,
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
              padding: EdgeInsets.only(bottom: 400),
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
              padding: EdgeInsets.only(top: 350),
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
              padding: EdgeInsets.only(bottom: 400, left: 20),
              child: Image.asset(
                "assets/images/celsius.png",
                height: size.height * 0.12,
              ),
            ),
          ]),
          
          new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 110, left: 70),
              child: Text(
                "Humidity",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 70),
              child: Text(
                _Hval + "%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 110, right: 50),
              child: Text(
                "Temperature",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.only(top: 30, right: 50),
              child: Text(
                _ETval + "°C",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 290),
              child: Text(
                "Soil Temperature",
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
                _STval + " °C",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 570),
              child: proSqButton(
                text: "Back",
                press: () {
                  Back(context);
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Future<void> chkTvalue() async {
    var Eval = int.parse(_ETval);

    print("object");
    if (Eval > 35 ) {
      ShowNotification(
          id: 0, title: "Temperature", body: "Environment Temperature is High");
      ShowNotification(
          id: 1, title: "Temperature", body: "Turn on the Solenoid valve");

          LoginScreen.twilioFlutter.sendSMS(
                                      toNumber: LoginScreen.loggedcontat! ,
                                      messageBody:"Environment Temperature is High\nTurn on the Solenoid valve");

    }
    
  }

  Future<void> chkHvalue() async {
    var Hval = int.parse(_Hval);
    print("object");
    if (Hval > 80) {
      ShowNotification(
          id: 2, title: "Humidity", body: "Environment Humidity is High");
           LoginScreen.twilioFlutter.sendSMS(
          toNumber: LoginScreen.loggedcontat!,
          messageBody:
              "Environment Humidity is High");
    }
  }

  Future<void> chkSTvalue() async {
    var STval = int.parse(_STval);
    print("object");
    if (STval > 15) {
      ShowNotification(
          id: 3, title: "Soil Temperature", body: "Soil Temperature is High");
      ShowNotification(
          id: 4, title: "Soil Temperature", body: "Turn on the Solenoid valve");

              LoginScreen.twilioFlutter.sendSMS(
          toNumber: LoginScreen.loggedcontat!,
          messageBody: "Soil Temperature is High\nTurn on the Solenoid valve");
    }
  }

  Future<void> getHvalue() async {
    String data = "";

    if (ScanQrPage.deviceId != null) {
      DatabaseReference starCountRef = FirebaseDatabase.instance
          .ref('Devices/' + ScanQrPage.deviceId! + '/SensorValue/humidity');
      starCountRef.onValue.listen((DatabaseEvent event) {
        data = event.snapshot.value.toString();
        setState(() {
          _Hval = data;
          chkHvalue();
        });
      });
    }
  }

  Future<void> getETvalue() async {
    String data = "";
    DatabaseReference starCountRef = FirebaseDatabase.instance
        .ref('Devices/' + ScanQrPage.deviceId! + '/SensorValue/ETemp');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _ETval = data;
        chkTvalue();
      });
    });
  }

  Future<void> getSTvalue() async {
    String data = "";
    DatabaseReference starCountRef = FirebaseDatabase.instance
        .ref('Devices/' + ScanQrPage.deviceId! + '/SensorValue/soilTemp');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _STval = data;
        chkSTvalue();
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
