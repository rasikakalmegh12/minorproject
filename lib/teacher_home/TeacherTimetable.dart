// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:schoolsys/teacher_drawer/tdrawer.dart';


class TTimetable extends StatelessWidget {
  const TTimetable({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Timetable')),
      drawer: const MyDrawer1(),
      body: const Center(child: Text('welcome')),
    );
  }
}