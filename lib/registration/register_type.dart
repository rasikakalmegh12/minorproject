import 'package:flutter/material.dart';
import 'package:schoolsys/registration/student_registration.dart';
import 'package:schoolsys/registration/teacher_registration.dart';
import 'package:schoolsys/registration/z_student.dart';
import 'package:schoolsys/registration/teacher.dart';

class Rgstr extends StatefulWidget {
  const Rgstr({Key? key}) : super(key: key);

  @override
  _Rgstr createState() => _Rgstr();
}

class _Rgstr extends State<Rgstr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 180.0,
                ),
                Text(
                  'Choose Account Type',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
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
                            builder: (context) => const Student1(),
                          )),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/students.png',
                              height: 120,
                              width: 120,
                            ),
                            const Text('Student',
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                            builder: (context) => const Teacher1(),
                          )),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/teacher.png',
                              height: 120,
                              width: 120,
                            ),
                            const Text(
                              'Teacher',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
