import 'package:flutter/material.dart';
import 'package:soil_npk_app/NavBar.dart';
import 'package:soil_npk_app/Screens/HTemp/body.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/components/QRcode.dart';
import 'package:soil_npk_app/main_screen.dart';

class HTScreen extends StatefulWidget {
  const HTScreen({Key? key}) : super(key: key);

  @override
  State<HTScreen> createState() => _HTScreenState();
}

class _HTScreenState extends State<HTScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (ScanQrPage.deviceId == null) {
      ///Show msg

      print(ScanQrPage.deviceId);
      MainScreen.pageIndex = 1;
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Add Device"),
            content: Text("Add device to view data"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  },
                  child: Text("OK"))
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Humidity and Temperature',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: NavBar(),
      body: SafeArea(child: Body()),
    );
  }
}
