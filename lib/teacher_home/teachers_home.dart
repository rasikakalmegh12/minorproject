import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/drawer/drawer.dart';
import 'package:schoolsys/login.dart';
import 'package:schoolsys/teacher_home/TeacherAttendence.dart';
import 'package:schoolsys/teacher_home/TeacherNoticeBoard.dart';
import 'package:schoolsys/teacher_home/TeacherTimetable.dart';
import 'package:schoolsys/teacher_home/t_noticeboard.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Teachers HomePage"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
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
                      builder: (context) => const TTimetable(
                        title: '',
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
                      builder: (context) => const TAttendance(
                        title: '',
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
                      const Text('Attendance'),
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
                      builder: (context) => const Notice_Teacher(),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/noticeboard.png',
                        height: 120,
                        width: 120,
                      ),
                      const Text('Notice Board')
                    ]),
              ),
            ),
          ]),
    );
  }
}
