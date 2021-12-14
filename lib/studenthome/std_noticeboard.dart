// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:schoolsys/drawer/drawer.dart';

class Notice_Student extends StatefulWidget {
  const Notice_Student({Key? key}) : super(key: key);

  @override
  _Notice_StudentState createState() => _Notice_StudentState();
}

class _Notice_StudentState extends State<Notice_Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notice Board')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('welcome')),
    );
  }
}
