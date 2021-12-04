import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/database/timetable_model.dart';

//Timetable Insertion function
void timetableInsertion(String subject, String start_date, String end_date,
    BuildContext context) async {
  // calling firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  TimetableModel timetable = TimetableModel();
  timetable.uid = user!.uid;
  timetable.subject = subject;
  timetable.start_time = start_date;
  timetable.end_time = end_date;

  await firebaseFirestore
      .collection("timetable")
      .doc(user.uid)
      .set(timetable.toMap());

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Subject added successfully'),
    ),
  );
}
