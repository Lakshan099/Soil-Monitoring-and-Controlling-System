import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/NavBar.dart';
import 'package:soil_npk_app/NewsFeed/RSSDemo.dart';
import 'package:soil_npk_app/Screens/Home/Home_Screen.dart';
import 'package:soil_npk_app/Screens/Notification/Nread.dart';
import 'package:soil_npk_app/Screens/Notification/background.dart';
import 'package:soil_npk_app/Screens/Notification/ncard.dart';
import 'package:soil_npk_app/Screens/Notification/notification_screen.dart';
import 'package:soil_npk_app/components/rounded_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soil_npk_app/components/sqButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NavBar()));
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.noti,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.messages,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Massage")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        //crossAxisSpacing: 18,
                        // mainAxisSpacing: 18,
                      ),
                      children: snapshot.data!.docs
                          .map((note) => Ncard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Nreader(note),
                                    ));
                              }, note))
                          .toList(),
                    );
                  }
                  return Text(
                    "No Notificatiions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
