import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soil_npk_app/Screens/Setting/background.dart';

import '../../components/theme_picker.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //SizedBox(height: size.height * 0.1),
          AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon(),
                Container(
                    padding: EdgeInsets.fromLTRB(1, 20, 80, 20),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ))
              ],
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),

          Divider(),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            prefixIcon1(),
            Padding(
              padding: EdgeInsets.fromLTRB(1, 20, 80, 20),
              child: Text(
                "Notification",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SwitchState(),
            )
          ]),
          Divider(),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            prefixIcon2(),
            Padding(
              padding: EdgeInsets.fromLTRB(1, 20, 85, 20),
              child: Text(
                "Dark Mode",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SwitchState1(),
            )
          ]),
          Divider(),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            prefixIcon3(),
            Padding(
              padding: EdgeInsets.fromLTRB(1, 20, 118, 20),
              child: Text(
                "Sound",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SwitchState2(),
            )
          ]),
        ],
      ),
    );
  }
}

Widget prefixIcon1() {
  return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      child: Icon(
        Icons.notifications,
        size: 30,
        color: Colors.white,
      ));
}

Widget prefixIcon2() {
  return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      child: Icon(
        Icons.dark_mode,
        size: 30,
        color: Colors.white,
      ));
}

Widget prefixIcon3() {
  return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      child: Icon(
        Icons.music_note,
        size: 30,
        color: Colors.white,
      ));
}

Widget prefixIcon() {
  return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      child: Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
      ));
}

void setStateON() => Fluttertoast.showToast(
      msg: "Notification on",
      fontSize: 18,
    );

void showToastOFF() => Fluttertoast.showToast(
      msg: "Notification off",
      fontSize: 18,
    );

class SwitchState extends StatefulWidget {
  @override
  SwichClass createState() => new SwichClass();
}

class SwichClass extends State {
  bool isSwitched = false;

  void NotiSwitch(bool vlaue) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      setStateON();
    } else {
      setState(() {
        isSwitched = false;
      });
      showToastOFF();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 1.2,
          child: Switch(
            onChanged: NotiSwitch,
            value: isSwitched,
            activeColor: Color.fromARGB(255, 240, 240, 240),
            activeTrackColor: Color.fromARGB(255, 76, 218, 100),
            inactiveThumbColor: Color.fromARGB(255, 250, 248, 248),
            inactiveTrackColor: Color.fromARGB(255, 230, 226, 226),
          )),
    ]);
  }
}

void DarkON() {
  
 
Fluttertoast.showToast(
      msg: "DarkMode on",
      fontSize: 18,
    );
} 

void DarkOFF() {
  
   Fluttertoast.showToast(
    msg: "DarkMode off",
    fontSize: 18,
  );
} 

class SwitchState1 extends StatefulWidget {
  @override
  SwichClass1 createState() => new SwichClass1();
  
}

class SwichClass1 extends State {
  bool isSwitched = false;

  initState(){

    super.initState();
    if(ThemeProvider.themeMode == ThemeMode.dark){
      setState(() {
        isSwitched = true;
      });
    }else{
      setState(() {
        isSwitched = false;
      });
    }
  }

  void NotiSwitch1(bool vlaue) {
    if (isSwitched == false) {
      setState(() {
         ThemeProvider().toggleTheme(true);
         ThemeProvider.themeMode=ThemeMode.dark;
        isSwitched = true;
      });
      DarkON();
    } else {
      setState(() {
           ThemeProvider().toggleTheme(false);
          ThemeProvider.themeMode = ThemeMode.light;
         print(ThemeProvider.themeMode);
        isSwitched = false;
      });
      DarkOFF();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 1.2,
          child: Switch(
            onChanged: NotiSwitch1,
            value: isSwitched,
            activeColor: Color.fromARGB(255, 240, 240, 240),
            activeTrackColor: Color.fromARGB(255, 76, 218, 100),
            inactiveThumbColor: Color.fromARGB(255, 250, 248, 248),
            inactiveTrackColor: Color.fromARGB(255, 230, 226, 226),
          )),
    ]);
  }
}

void SoundON() => Fluttertoast.showToast(
      msg: "Sound on",
      fontSize: 18,
    );

void SoundOFF() => Fluttertoast.showToast(
      msg: "Sound off",
      fontSize: 18,
    );

class SwitchState2 extends StatefulWidget {
  @override
  SwichClass2 createState() => new SwichClass2();
}

class SwichClass2 extends State {
  bool isSwitched = false;

  void NotiSwitch2(bool vlaue) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      SoundON();
    } else {
      setState(() {
        isSwitched = false;
      });
      SoundOFF();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 1.2,
          child: Switch(
            onChanged: NotiSwitch2,
            value: isSwitched,
            activeColor: Color.fromARGB(255, 240, 240, 240),
            activeTrackColor: Color.fromARGB(255, 76, 218, 100),
            inactiveThumbColor: Color.fromARGB(255, 250, 248, 248),
            inactiveTrackColor: Color.fromARGB(255, 230, 226, 226),
          )),
    ]);
  }
}
