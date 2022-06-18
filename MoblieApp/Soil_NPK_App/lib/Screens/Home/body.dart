import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/NewsList/newslist.dart';
import 'package:soil_npk_app/Screens/Home/Home_Screen.dart';
import 'package:soil_npk_app/Screens/Home/background.dart';
import 'package:soil_npk_app/Screens/SignUp/signup_screen.dart';
import 'package:soil_npk_app/Screens/analytics/linechart.dart';
import 'package:soil_npk_app/components/language_picker.dart';
import 'package:soil_npk_app/components/newsButton.dart';
import 'package:soil_npk_app/components/rounded_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soil_npk_app/components/sqButton.dart';
import 'package:soil_npk_app/components/theme_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  int currentIndex = 0;

  var titleList = [
    "FAO leads training sessions",
    "Climate-smart livestock management",
    "FAO joins the Sustainable Rice",
    "Alliance for Smart Agriculturen",
    "Being climate-smart in agriculture",
    "Courses on climate-smart agriculture",
    "FAO Kenya Representative discusses"
  ];

  var descList = [
    "FAO supports a climate-smart agriculture (CSA) approach",
    "Marlene and Cornelio heard about FAO’s Climate-Smart",
    "The Sustainable Rice Platform (SRP) works with partners",
    "Before joining GACSA, I was in living back",
    "The reports are out and the message is clear",
    "These courses analyse climate change impacts",
    "Nairobi - Day two of the Africa Climate-Smart Agriculture"
  ];

  var imgList = [
    "assets/images/img1.png",
    "assets/images/img2.jpg",
    "assets/images/img3.png",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg",
    "assets/images/img7.jpg"
  ];

  var LinkList = [
    "https://www.fao.org/climate-smart-agriculture/news/detail/en/c/1393520/",
    "https://www.fao.org/fao-stories/article/en/c/1276771/",
    "https://www.fao.org/asiapacific/news/detail-events/en/c/1391829/",
    "https://www.fao.org/climate-smart-agriculture/news/detail/en/c/1205783/",
    "https://www.fao.org/fao-stories/article/en/c/1172370/",
    "https://www.fao.org/elearning/#/elc/en/courses/CLCH",
    "https://www.fao.org/climate-smart-agriculture/news/detail/en/c/1133440/"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 130),
              child: Image.asset(
                "assets/images/h1.png",
                width: size.width * 0.9,
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 340),
              child: Container(
                width: 330,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black54,
                      width: 5.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black87,
                ),
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 450),
              child: Image.asset(
                "assets/images/Soil-Systems-Logo.png",
                height: size.height * 0.15,
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: sqButton(
                text: AppLocalizations.of(context)!.find,
                press: () {
                  const url = 'http://soilsystems.me/';
                  launchURL(url);
                },
              ),
            ),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 340),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromARGB(59, 59, 59, 59),
                child: SizedBox(
                  width: 315,
                  height: 240,
                  child: Center(
                    child: ListView.builder(
                      itemCount: imgList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            launchURL(LinkList[index]);
                          },
                          child: Card(
                            child: SizedBox(
                              width: 100,
                              height: 70,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(imgList[index]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          titleList[index],
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            descList[index],
                                            maxLines: 3,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

launchURL(String url) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.inAppWebView,
    webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
  )) {
    throw 'Could not launch $url';
  }
}
