import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/drawer/contact.dart';
import 'package:schoolsys/drawer/changepass.dart';
import 'package:schoolsys/login.dart';
import 'package:schoolsys/drawer/profile.dart';
import 'package:share_plus/share_plus.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    borderRadius: const BorderRadius.all(Radius.circular(70.0)),
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
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Edit Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            }),
        ListTile(
            leading: const Icon(Icons.password),
            title: const Text('Change Password'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Password()));
            }),
        ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Contact()));
            }),
        ListTile(
          leading: const Icon(Icons.share),
          title: const Text('Share App'),
          onTap: () {
            Share.share(
                'https://drive.google.com/file/d/1k9ZM7ZKvkeAeIeU1pX4IbIwxM1hE5Yq-/view?usp=sharing');
          },
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Logout'),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ]),
    );
  }
}
