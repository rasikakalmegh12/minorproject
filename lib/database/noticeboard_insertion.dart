import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/database/noticeboard_model.dart';

// calling firestore
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//Timetable Insertion function
void noticeboardInsertion(String eventfield, BuildContext context) async {
  NoticeboardModel noticeboardModel = NoticeboardModel();

  noticeboardModel.eventfield = eventfield;

  print(eventfield);
  await firebaseFirestore
      .collection("eventfield")
      .add(noticeboardModel.toMap());

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Notice added successfully'),
    ),
  );
}
