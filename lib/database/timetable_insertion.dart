import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/database/timetable_model.dart';

//Timetable Insertion function
void timetableInsertion(String subject, String startDate, String endDate,
    BuildContext context) async {
  // calling firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TimetableModel timetable = TimetableModel();
  timetable.uid = "1";
  timetable.subject = subject;
  timetable.start_time = startDate;
  timetable.end_time = endDate;

  await firebaseFirestore
      .collection("timetable")
      .doc('1')
      .set(timetable.toMap());

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Subject added successfully'),
    ),
  );
}
