import 'package:flutter/material.dart';
import 'package:schoolsys/drawer/mani.dart';
import 'package:schoolsys/drawer/mohini.dart';
import 'package:schoolsys/drawer/nishu.dart';
import 'package:schoolsys/drawer/rasi.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Contact Us')),
        body: GridView.count(
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            padding: const EdgeInsets.all(15),
            primary: false,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mani(),
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/Mani.jpg',
                          height: 120,
                          width: 120,
                        ),
                        const Text('Manisha Gaikwad'),
                      ]),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Rasi(),
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/Rasi.jpeg',
                          height: 120,
                          width: 120,
                        ),
                        const Text('Rasika Kalmegh'),
                      ]),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Nishu(),
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/Nishu.jpeg',
                          height: 120,
                          width: 120,
                        ),
                        const Text('Nisha Bharuka'),
                      ]),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mohini(),
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/Mohini.jpeg',
                          height: 120,
                          width: 120,
                        ),
                        const Text('Mohini Gaikwad'),
                      ]),
                ),
              ),
            ]));
  }
}
