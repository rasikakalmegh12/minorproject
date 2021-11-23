import 'package:flutter/material.dart';
import 'package:schoolsys/drawer/drawer.dart';

class ExamTT extends StatelessWidget {
  const ExamTT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Details')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('welcome')),
    );
  }
}
