import 'package:flutter/material.dart';
import 'package:schoolsys/teacher_drawer/tdrawer.dart';

class Notice_Teacher extends StatefulWidget {
  const Notice_Teacher({Key? key}) : super(key: key);

  @override
  _Notice_TeacherState createState() => _Notice_TeacherState();
}

class _Notice_TeacherState extends State<Notice_Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notice Board')),
      drawer: const MyDrawer1(),
      body: const Center(child: Text('welcome')),
    );
  }
}
