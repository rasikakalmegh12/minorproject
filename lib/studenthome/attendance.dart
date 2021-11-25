import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:overlay_container/overlay_container.dart';
import 'package:schoolsys/drawer/drawer.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            OverlayContainer(
              show: _dropdownShown,
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 6,
                    )
                  ],
                ),
                child: const Text("I render outside the \nwidget hierarchy."),
              ),
            ),
            GestureDetector(
              onTap: _toggleDropdown,
              // ignore: missing_required_param

              child: Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(3.0, 3.0))
                    ]),
                child: const Text("COURSE NAME : \n\nFACULTY NAME:",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(3.0, 3.0))
                    ]),
                child: const Text("COURSE NAME : \n\nFACULTY NAME:",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(3.0, 3.0))
                    ]),
                child: const Text("COURSE NAME : \n\nFACULTY NAME:",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(3.0, 3.0))
                    ]),
                child: const Text("COURSE NAME : \n\nFACULTY NAME:",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(3.0, 3.0))
                    ]),
                child: const Text("COURSE NAME : \n\nFACULTY NAME:",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
