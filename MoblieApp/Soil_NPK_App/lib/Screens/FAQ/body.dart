import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/NavBar.dart';
import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/components/proSqButton.dart';

class MyHomePageState extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePageState> {
  String _Faq1Q = "";
  String _Faq1A = "";
  String _Faq2Q = "";
  String _Faq2A = "";
  String _Faq3Q = "";
  String _Faq3A = "";
  String _Faq4Q = "";
  String _Faq4A = "";
  String _Faq5Q = "";
  String _Faq5A = "";

  _MyHomePageState() {
    getFAQ1().then((val) => setState(() {
          _Faq1Q = val;
        }));

    getFAQ2().then((val2) => setState(() {
          _Faq1A = val2;
        }));
    getFAQ21().then((val3) => setState(() {
          _Faq2Q = val3;
        }));

    getFAQ22().then((val4) => setState(() {
          _Faq2A = val4;
        }));

    getFAQ31().then((val3) => setState(() {
          _Faq3Q = val3;
        }));

    getFAQ32().then((val4) => setState(() {
          _Faq3A = val4;
        }));

    getFAQ41().then((val3) => setState(() {
          _Faq4Q = val3;
        }));

    getFAQ42().then((val4) => setState(() {
          _Faq4A = val4;
        }));

    getFAQ51().then((val3) => setState(() {
          _Faq5Q = val3;
        }));

    getFAQ52().then((val4) => setState(() {
          _Faq5A = val4;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "01. " + _Faq1Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq1A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq1A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "02. " + _Faq2Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq2A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq2A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "03. " + _Faq3Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq3A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq3A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "04. " + _Faq4Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq4A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq4A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "05. " + _Faq5Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq5A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq5A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<String> getFAQ1() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I establish the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq1Q = doc["Question"];
        _Faq1A = doc["Answer"];
      });
    });
    return await _Faq1Q;
  }

  Future<String> getFAQ2() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I establish the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq1Q = doc["Question"];
        _Faq1A = doc["Answer"];
      });
    });
    return await _Faq1A;
  }

  Future<String> getFAQ21() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I use the mobile app?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq2Q = doc["Question"];
        _Faq2A = doc["Answer"];
      });
    });
    return await _Faq2Q;
  }

  Future<String> getFAQ22() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I use the mobile app?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq2Q = doc["Question"];
        _Faq2A = doc["Answer"];
      });
    });
    return await _Faq2A;
  }

  Future<String> getFAQ31() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question',
            isEqualTo: "How affected to the agriculteral industry?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq3Q = doc["Question"];
        _Faq3A = doc["Answer"];
      });
    });
    return await _Faq3Q;
  }

  Future<String> getFAQ32() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question',
            isEqualTo: "How affected to the agriculteral industry?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq3Q = doc["Question"];
        _Faq3A = doc["Answer"];
      });
    });
    return await _Faq3A;
  }

  Future<String> getFAQ41() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "Where can I buy the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq4Q = doc["Question"];
        _Faq4A = doc["Answer"];
      });
    });
    return await _Faq4Q;
  }

  Future<String> getFAQ42() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "Where can I buy the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq4Q = doc["Question"];
        _Faq4A = doc["Answer"];
      });
    });
    return await _Faq4A;
  }

  Future<String> getFAQ51() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I contact the Soil Systems?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq5Q = doc["Question"];
        _Faq5A = doc["Answer"];
      });
    });
    return await _Faq5Q;
  }

  Future<String> getFAQ52() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I contact the Soil Systems?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq5Q = doc["Question"];
        _Faq5A = doc["Answer"];
      });
    });
    return await _Faq5A;
  }
}
