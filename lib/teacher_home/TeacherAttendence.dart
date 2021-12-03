// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:schoolsys/teacher_drawer/tdrawer.dart';


class TAttendance extends StatelessWidget {
  const TAttendance({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Attendence')),
      drawer: const MyDrawer1(),
      body: const Center(child: Text('welcome')),
    );
  }
}