import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/database/timetable_model.dart';

// calling firestore
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//Timetable Insertion function
void timetableInsertion(String subject, String startDate, String endDate,
    BuildContext context) async {
  TimetableModel timetable = TimetableModel();

  timetable.subject = subject;
  timetable.start_time = startDate;
  timetable.end_time = endDate;

  await firebaseFirestore.collection("timetable").add(timetable.toMap());

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Subject added successfully'),
    ),
  );
}
