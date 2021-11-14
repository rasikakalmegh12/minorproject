import 'package:flutter/material.dart';
import 'package:schoolsys/drawer/drawer.dart';

class Marksheet extends StatelessWidget {
  const Marksheet({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const MyDrawer(),
      body: const Center(child: Text('welcome')),
    );
  }
}
