import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget Qcard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(213, 54, 53, 53),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["QuestionText"],
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
            doc["date"],
            style: TextStyle(
              color: Color.fromARGB(255, 247, 246, 246),
              fontWeight: FontWeight.normal,
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            doc["AnswerText"],
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
