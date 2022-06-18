import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Home/Home_Screen.dart';
import 'package:soil_npk_app/Screens/Notification/notification_screen.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/Screens/Progress/progress_screen.dart';
import 'package:soil_npk_app/Screens/SoilM/soilM_screen.dart';
import 'package:soil_npk_app/Screens/SoilNPK/soilNPK_screen.dart';

import 'Screens/analytics/analytics_screen.dart';

class MainScreen extends StatefulWidget {
  static int? pageIndex;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    ProScreen(),
    AnalyticsScreen(),
    NotificationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[MainScreen.pageIndex!],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 134, 166, 93)),
        selectedItemColor: Color.fromARGB(255, 134, 166, 93),
        unselectedItemColor:
            Color.fromARGB(255, 134, 134, 133).withOpacity(0.60),
        currentIndex: MainScreen.pageIndex!,
        onTap: (value) {
          setState(() {
            MainScreen.pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'System',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Notification',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
