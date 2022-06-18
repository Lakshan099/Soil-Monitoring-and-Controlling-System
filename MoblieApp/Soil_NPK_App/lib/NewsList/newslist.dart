import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Home/body.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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
    double width = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      backgroundColor: Color.fromARGB(59, 59, 59, 59),
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              launchURL1(LinkList[index]);
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: width,
                            child: Text(
                              descList[index],
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 11.5,
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
    );
  }
}

launchURL1(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
