import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Q&A/Qcard.dart';
import 'package:soil_npk_app/Screens/Q&A/Qeditor.dart';
import 'package:soil_npk_app/Screens/Q&A/Qreader.dart';

class QandA extends StatefulWidget {
  const QandA({Key? key}) : super(key: key);

  @override
  State<QandA> createState() => _QandAState();
}

class _QandAState extends State<QandA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Questions",
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
                stream:
                    FirebaseFirestore.instance.collection("Q&A").snapshots(),
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
                        crossAxisCount: 2,
                        //crossAxisSpacing: 18,
                        // mainAxisSpacing: 18,
                      ),
                      children: snapshot.data!.docs
                          .map((note) => Qcard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Qreader(note),
                                    ));
                              }, note))
                          .toList(),
                    );
                  }
                  return Text(
                    "No questions",
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Qeditior()));
        },
        label: Text("Add Question"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
