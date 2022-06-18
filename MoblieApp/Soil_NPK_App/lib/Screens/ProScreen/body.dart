import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/HTemp/HT_screen.dart';
import 'package:soil_npk_app/Screens/ProScreen/background.dart';
import 'package:soil_npk_app/Screens/SoilM/soilM_screen.dart';
import 'package:soil_npk_app/Screens/SoilNPK/soilNPK_screen.dart';
import 'package:soil_npk_app/Screens/SoleValve/Sval_screen.dart';
import 'package:soil_npk_app/components/QRcode.dart';
import 'package:soil_npk_app/components/notificationAPI.dart';
import 'package:soil_npk_app/components/notificationLocation.dart';
import 'package:soil_npk_app/components/proSqButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

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
        children: <Widget>[
          //SizedBox(height: size.height * 0.1),
          AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/computer.png',
                    fit: BoxFit.contain, height: 32, color: Colors.white),
                Container(
                    padding: EdgeInsets.fromLTRB(1, 20, 80, 20),
                    child: Text(
                      AppLocalizations.of(context)!.system,
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
          SizedBox(
            height: size.height * 0.02,
          ),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: TextButton(
                    onPressed: () {
                      HumidityTap(context);
                    },
                    child: Image.asset(
                      "assets/images/humidity.png",
                      width: size.width * 0.6,
                    ))),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      soilMScreenTap(context);
                    },
                    child: Image.asset(
                      "assets/images/soilmois.png",
                      width: size.width * 0.6,
                    ))),
          ]),

          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: TextButton(
                    onPressed: () {
                      soilNPKScreenTap(context);
                    },
                    child: Image.asset(
                      "assets/images/npk.png",
                      width: size.width * 0.6,
                    ))),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      SoleValveTap(context);
                    },
                    child: Image.asset(
                      "assets/images/solenoid.png",
                      width: size.width * 0.6,
                    ))),
          ]),
          proSqButton(
            text: AppLocalizations.of(context)!.asystem,
            press: () {
              QR(context);
            },
          ),
        ],
      ),
    );
  }
}

void soilMScreenTap(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => soilMScreen(),
    ),
  );
}

void soilNPKScreenTap(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => soilNPKScreen(),
    ),
  );
}

void HumidityTap(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => HTScreen(),
    ),
  );
}

void SoleValveTap(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => SoleValve(),
    ),
  );
}

void QR(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => ScanQrPage(),
    ),
  );
}
