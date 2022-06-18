import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Qeditior extends StatefulWidget {
  const Qeditior({Key? key}) : super(key: key);

  @override
  State<Qeditior> createState() => _QeditiorState();
}

class _QeditiorState extends State<Qeditior> {
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(213, 54, 53, 53),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(213, 54, 53, 53),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 247, 246, 246)),
        title: Text(
          "Add a new Question",
          style: TextStyle(
            color: Color.fromARGB(255, 247, 246, 246),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Question',
              ),
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
              date,
              style: TextStyle(
                color: Color.fromARGB(255, 247, 246, 246),
                fontWeight: FontWeight.normal,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Answer',
              ),
              style: TextStyle(
                color: Color.fromARGB(255, 247, 246, 246),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(212, 31, 0, 172),
        onPressed: () async {
          FirebaseFirestore.instance.collection("Q&A")
          .doc(
                _titleController.text
              )
          .set({
            "QuestionText": _titleController.text,
            "date": date,
            "AnswerText": _mainController.text
          }).then((value) {
            //print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Faild to add $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
