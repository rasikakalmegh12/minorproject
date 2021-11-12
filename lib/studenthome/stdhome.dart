import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schoolsys/login.dart';
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
      drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bgimage.jpg'), fit: BoxFit.cover),
            ),
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(70.0)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Image.asset(
                          'assets/user.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Username',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ]),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Edit Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Teachers Details'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('About App'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share App'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              }),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
          ),
        ]),
      ),
    );
  }
}
