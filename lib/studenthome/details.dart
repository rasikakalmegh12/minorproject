import 'package:flutter/material.dart';

class StdDetails extends StatelessWidget {
  const StdDetails({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Material(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:
                        Image.asset('assets/user.png', width: 100, height: 100),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Roll Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Class',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    labelText: 'Date Of Birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Religion',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Caste',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        labelText: 'Nationality',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ))
                  ],
                ),
              ]),
        ),
      )),
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
