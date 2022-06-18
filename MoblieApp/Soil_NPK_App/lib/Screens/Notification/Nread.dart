import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Nreader extends StatefulWidget {
  Nreader(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<Nreader> createState() => _NreaderState();
}

class _NreaderState extends State<Nreader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(213, 54, 53, 53),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(213, 54, 53, 53),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["Massage"],
              style: TextStyle(
                color: Color.fromARGB(255, 247, 246, 246),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.doc["date"],
              style: TextStyle(
                color: Color.fromARGB(255, 247, 246, 246),
                fontWeight: FontWeight.normal,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            Text(
              widget.doc["Sender"],
              style: TextStyle(
                color: Color.fromARGB(255, 247, 246, 246),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
