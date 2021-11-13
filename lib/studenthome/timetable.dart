import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {
  const Timetable({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: SingleChildScrollView(
            child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Timetable(
                  title: '',
                ),
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
      drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bgimage.jpg'), fit: BoxFit.cover),
            ),
            // ignore: avoid_unnecessary_containers

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
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ]),
      ),
    );
  }
}
