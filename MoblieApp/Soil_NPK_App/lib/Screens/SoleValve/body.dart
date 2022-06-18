import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Login/login_screen.dart';
import 'package:soil_npk_app/Screens/Notification/body.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/Screens/Progress/background.dart';
import 'package:soil_npk_app/Screens/Progress/body.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:soil_npk_app/components/QRcode.dart';
import 'package:soil_npk_app/components/notificationAPI.dart';
import 'package:soil_npk_app/components/notificationLocation.dart';
import 'dart:async';

import 'package:soil_npk_app/components/proSqButton.dart';
import 'package:soil_npk_app/main_screen.dart';

Color circleColor1 = Color.fromARGB(255, 150, 150, 150);
double circleRadius1 = 10;

class Body extends StatefulWidget {
  @override
  _StatefulWidgetDemoState createState() => _StatefulWidgetDemoState();
}

class _StatefulWidgetDemoState extends State<Body> {
  int currentIndex = 0;
  int? switchStatus;
  String statText = "ON";

  initState() {
    readdata();
    super.initState();
    NotificationService().requestPermission();
  }

  Future<void> readdata() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Devices/20220101/WaterPump/valve').get();
    if (snapshot.exists) {
      switchStatus = int.parse(snapshot.value.toString());
      if (snapshot.value.toString() == '1') {
        print("object");
        setState(() {
          circleColor1 = Color.fromARGB(255, 5, 236, 25);
          circleRadius1 = 10;
          statText = "OFF";
          ShowNotification(
              id: 0,
              title: "Solenoid Valve",
              body: "Turn ON by Unit");
          LoginScreen.twilioFlutter.sendSMS(
              toNumber: LoginScreen.loggedcontat!,
              messageBody: "Solenoid Valve\nTurn ON by Unit");
        });
      } else {
        setState(() {
          circleColor1 = Color.fromARGB(255, 150, 150, 150);
          circleRadius1 = 10;
          statText = "ON";
        });
      }
    } else {
      print('No data available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 400, left: 10),
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
              padding: EdgeInsets.only(bottom: 50, left: 10),
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
              padding: EdgeInsets.only(bottom: 400, left: 10),
              child: Image.asset(
                "assets/images/valve.png",
                height: size.height * 0.2,
                width: size.width * 0.20,
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 60, right: 120),
              child: Text(
                "Tap to " + statText,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ]),
          Container(
            width: 400,
            height: 400,
            child: CustomPaint(
              painter: OpenPainter(),
            ),
          ),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 60, left: 140),
              child: RaisedButton(
                onPressed: () {
                  if (switchStatus == 1) {
                    setSvalueF();
                    setState(() {
                      switchStatus = 0;
                      circleColor1 = Color.fromARGB(255, 150, 150, 150);
                      circleRadius1 = 10;
                      statText = "ON";
                    });
                  } else {
                    setSvalueT();
                    setState(() {
                      switchStatus = 1;
                      circleColor1 = Color.fromARGB(255, 5, 236, 25);
                      circleRadius1 = 10;
                      statText = "OFF";
                    });
                  }
                },
                child: Image.asset(
                  "assets/images/seloTap2.png",
                  width: size.width * 0.2,
                ),
              ),
            ),
          ]),
           new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 400),
              child: proSqButton(
              text: "Back",
              press: () {
                Back(context);
              },),
            ),
          ]),
        ],
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    var paint1 = Paint()
      ..color = circleColor1
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(330, -40), circleRadius1, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

Future<void> setSvalueT() async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref('Devices/' + ScanQrPage.deviceId! + '/WaterPump');
  await ref.set({
    "valve": 1,
  });
}

Future<void> setSvalueF() async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref('Devices/' + ScanQrPage.deviceId! + '/WaterPump');
  await ref.update({
    "valve": 0,
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
