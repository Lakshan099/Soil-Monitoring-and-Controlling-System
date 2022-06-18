import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Home/body.dart';
import 'package:soil_npk_app/Screens/Login/login_screen.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/Screens/Progress/background.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:soil_npk_app/components/QRcode.dart';
import 'package:soil_npk_app/components/noticlick.dart';
import 'package:soil_npk_app/components/notificationAPI.dart';
import 'package:soil_npk_app/components/notificationLocation.dart';
import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:soil_npk_app/components/proSqButton.dart';
import 'package:soil_npk_app/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  @override
  _StatefulWidgetDemoState createState() {
    return new _StatefulWidgetDemoState();
  }
}

class _StatefulWidgetDemoState extends State<Body> {
  String _Kval = "";
  String _Nval = "";
  String _Pval = "";
  bool selected = false;

  initState() {
    getKvalue();
    getNvalue();
    getPvalue();
    chkKvalue();
    chkNvalue();
    chkPvalue();
    chkAllvalue();
    super.initState();
    NotificationService().requestPermission();
    //NotificationApi.init();
    //listenNotification();
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
          new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 110, left: 60),
              child: Text(
                "Nitrogen",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(top: 40, left: 60),
              child: Text(
                _Nval + "%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 110, right: 60),
              child: Text(
                "Posperus",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.only(top: 40, right: 60),
              child: Text(
                _Pval + "%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 405),
              child: Image.asset(
                "assets/images/soil.png",
                height: size.height * 0.2,
                width: size.width * 0.16,
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 290),
              child: Text(
                "Potasium",
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
                _Kval + "%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50),
              ),
            ),
          ]),
          /* new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 600, left: 300),
              child: IconButton(
                icon: Icon(
                  selected ? Icons.notifications : Icons.notifications_off,
                  size: 26.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (selected = !selected) {
                      chkKvalue();
                      chkNvalue();
                      chkPvalue();
                      chkAllvalue();
                      //_showNotificationWithButton();
                    }
                  });
                },
              ),
            ),
          ]),*/
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 590),
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

  Future<void> getKvalue() async {
    String data = "";
    DatabaseReference starCountRef = FirebaseDatabase.instance
        .ref('Devices/' + ScanQrPage.deviceId! + '/SensorValue/NPK/K');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _Kval = data;
        chkKvalue();
        //onClickedNotification(payload);
      });
    });
  }

  Future<void> chkKvalue() async {
    var Pval = int.parse(_Pval);
    var Nval = int.parse(_Nval);
    var Kval = int.parse(_Kval);
    if (Pval > 30 && Nval > 30 && Kval < 30) {
      ShowNotification(
          id: 0, title: "NPK Values", body: "Potasium values are getting low");

      ShowNotification(
          id: 1,
          title: "Nearest Shop to buy",
          body: "Seed & Plant Retail Shop");

      LoginScreen.twilioFlutter.sendSMS(
          toNumber: LoginScreen.loggedcontat!,
          messageBody:
              "Potasium values are getting low.\nYou can visit nearest shop to buy\nSeed & Plant Retail Shop\nWebsite - https://doa.gov.lk/ \nDirections - https://www.google.com/maps/dir//agriculture+shop+near+colombo/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3ae2596eccf06917:0x7a94b1cab4b048a?sa=X&ved=2ahUKEwj__NPshLD4AhXqT2wGHc42BbEQ9Rd6BAgDEAQ");
    }
  }

  Future<void> chkNvalue() async {
    var Pval = int.parse(_Pval);
    var Nval = int.parse(_Nval);
    var Kval = int.parse(_Kval);
    print("object");
    if (Pval > 30 && Nval < 30 && Kval > 30) {
      ShowNotification(
          id: 2, title: "NPK Values", body: "Nitrogen values are getting low");
    
    ShowNotification(
        id: 5, title: "Nearest Shop to buy", body: "Seed & Plant Retail Shop");

    LoginScreen.twilioFlutter.sendSMS(
        toNumber: LoginScreen.loggedcontat!,
        messageBody:
            "Nitrogen values are getting low.\nYou can visit nearest shop to buy\nSeed & Plant Retail Shop\nWebsite - https://doa.gov.lk/ \nDirections - https://www.google.com/maps/dir//agriculture+shop+near+colombo/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3ae2596eccf06917:0x7a94b1cab4b048a?sa=X&ved=2ahUKEwj__NPshLD4AhXqT2wGHc42BbEQ9Rd6BAgDEAQ");
    }
  }

  Future<void> chkPvalue() async {
    var Pval = int.parse(_Pval);
    var Nval = int.parse(_Nval);
    var Kval = int.parse(_Kval);
    if (Pval < 30 && Nval > 30 && Kval > 30) {
      ShowNotification(
          id: 3, title: "NPK Values", body: "Posperus values are getting low");
    
    ShowNotification(
        id: 6, title: "Nearest Shop to buy", body: "Seed & Plant Retail Shop");

    LoginScreen.twilioFlutter.sendSMS(
        toNumber: LoginScreen.loggedcontat!,
        messageBody:
            "Nitrogen values are getting low.\nYou can visit nearest shop to buy\nSeed & Plant Retail Shop\nWebsite - https://doa.gov.lk/ \nDirections - https://www.google.com/maps/dir//agriculture+shop+near+colombo/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3ae2596eccf06917:0x7a94b1cab4b048a?sa=X&ved=2ahUKEwj__NPshLD4AhXqT2wGHc42BbEQ9Rd6BAgDEAQ");
    }
  }

  Future<void> chkAllvalue() async {
    var Pval = int.parse(_Pval);
    var Nval = int.parse(_Nval);
    var Kval = int.parse(_Kval);
    if (Pval < 30 && Nval < 30 && Kval < 30) {
      ShowNotification(
          id: 4, title: "NPK Values", body: "All NPK values are getting low");
    

    LoginScreen.twilioFlutter.sendSMS(
        toNumber: LoginScreen.loggedcontat!,
        messageBody: "All NPK values are getting low");
    }
  }

  void _showNotificationWithButton() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: 'Simple body'),
      actionButtons: <NotificationActionButton>[
        NotificationActionButton(key: 'yes', label: 'Yes'),
        NotificationActionButton(key: 'no', label: 'No'),
      ],
    );
  }

  Future<void> getNvalue() async {
    String data = "";
    DatabaseReference starCountRef = FirebaseDatabase.instance
        .ref('Devices/' + ScanQrPage.deviceId! + '/SensorValue/NPK/N');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _Nval = data;
        chkNvalue();
      });
    });
  }

  Future<void> getPvalue() async {
    String data = "";
    DatabaseReference starCountRef = FirebaseDatabase.instance
        .ref('Devices/' + ScanQrPage.deviceId! + '/SensorValue/NPK/P');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _Pval = data;
        chkPvalue();
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

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//void listenNotification() =>
  ////NotificationApi.onNotifications.stream.listen(onClickedNotification);


//void onClickedNotification(String? payload) => launchURL('http://soilsystems.me/');





