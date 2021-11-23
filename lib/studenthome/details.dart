import 'package:flutter/material.dart';
import 'package:schoolsys/drawer/drawer.dart';

class StdDetails extends StatelessWidget {
  const StdDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      drawer: const MyDrawer(),
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
    );
  }
}
