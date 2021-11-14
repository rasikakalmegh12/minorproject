import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schoolsys/drawer/drawer.dart';
import 'package:schoolsys/studenthome/details.dart';
import 'package:schoolsys/studenthome/events.dart';
import 'package:schoolsys/studenthome/exam.dart';
import 'package:schoolsys/studenthome/homework.dart';
import 'package:schoolsys/studenthome/marksheet.dart';
import 'package:schoolsys/studenthome/timetable.dart';

class StdHome extends StatelessWidget {
  const StdHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const MyDrawer(),
      body: GridView.count(
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.all(15),
          primary: false,
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              color: Colors.grey.shade200,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StdDetails(
                        title: 'SchoolSYS',
                      ),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/student.png',
                        height: 120,
                        width: 120,
                      ),
                      const Text('Student Deatils'),
                    ]),
              ),
            ),
            Card(
              color: Colors.grey.shade200,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Timetable(
                        title: 'SchoolSYS',
                      ),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/timetable.png',
                        height: 120,
                        width: 120,
                      ),
                      const Text('Time Table')
                    ]),
              ),
            ),
            Card(
              color: Colors.grey.shade200,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExamTT(
                        title: 'SchoolSYS',
                      ),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/exam.png',
                        height: 120,
                        width: 120,
                      ),
                      const Text('Exam')
                    ]),
              ),
            ),
            Card(
              color: Colors.grey.shade200,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Marksheet(
                        title: 'SchoolSYS',
                      ),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/webpage.png',
                        height: 120,
                        width: 120,
                      ),
                      const Text('Marksheet'),
                    ]),
              ),
            ),
            Card(
              color: Colors.grey.shade200,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Homework(
                        title: 'SchoolSYS',
                      ),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/homework.png',
                        height: 120,
                        width: 120,
                      ),
                      const Text('Homework'),
                    ]),
              ),
            ),
            Card(
              color: Colors.grey.shade200,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Events(
                        title: 'SchoolSYS',
                      ),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/event.png',
                        height: 120,
                        width: 120,
                      ),
                      const Text('Events'),
                    ]),
              ),
            )
          ]),
    );
  }
}
