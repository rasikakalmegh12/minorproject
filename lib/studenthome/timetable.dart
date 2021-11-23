import 'package:flutter/material.dart';
import 'package:schoolsys/drawer/drawer.dart';

class Timetable extends StatelessWidget {
  const Timetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Table')),
      drawer: const MyDrawer(),
      body: Center(
        child: SingleChildScrollView(
            child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Timetable(),
              )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/FY-MCA_page.jpg',
                  height: 700,
                  width: 700,
                ),
                const Text('Time Table Fy- MCA',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
        )),
      ),
    );
  }
}
