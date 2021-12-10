// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:schoolsys/database/registration_functions.dart';
import 'package:schoolsys/drawer/drawer.dart';
import 'package:intl/intl.dart';

class StdDetails extends StatelessWidget {
  const StdDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Student Details';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        drawer: const MyDrawer(),
        body: const MyStudentDetailsForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyStudentDetailsForm extends StatefulWidget {
  const MyStudentDetailsForm({Key? key}) : super(key: key);

  @override
  MyStudentDetailsFormState createState() {
    return MyStudentDetailsFormState();
  }
}

class MyStudentDetailsFormState extends State<MyStudentDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? data;
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController enroll = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController stdclass = TextEditingController();
  final TextEditingController religion = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController caste = TextEditingController();
  final TextEditingController nationality = TextEditingController();
  final TextEditingController intialdateval = TextEditingController();
  var genderList = ['Male', 'Female', 'Others'];
  late String selectedScene = genderList.first;
  var nameDb;
  var enrollDb;
  var emailDb;
  var phoneDb;
  var addressDb;
  var stdclassDb;
  var religionDb;
  var categoryDb;
  var casteDb;
  var nationalityDb;

  @override
  void initState() {
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    super.initState();
  }

  Future<void> getDataFromFireStore() async {
    User? user = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('students');
    var docSnapshot = await collection.doc(user!.uid).get();
    if (docSnapshot.exists) {
      data = docSnapshot.data();
      setState(() {
        nameDb = data?['fullname'];
        emailDb = data?['email'];
        enrollDb = data?['enroll'];
        phoneDb = data?['phone'];
        addressDb = data?['address'];
        stdclassDb = data?['stdclass'];
        religionDb = data?['religion'];
        categoryDb = data?['category'];
        casteDb = data?['caste'];
        nationalityDb = data?['nationality'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (nameDb != null) {
    //   fullname.text = nameDb;
    // }
    // if (emailDb != null) {
    //   email.text = emailDb;
    // }
    // if (enrollDb != null) {
    //   enroll.text = enrollDb;
    // }
    // if (phoneDb != null) {
    //   phone.text = phoneDb;
    // }
    // if (addressDb != null) {
    //   address.text = addressDb;
    // }
    // if (stdclassDb != null) {
    //   stdclass.text = stdclassDb;
    // }
    // if (religionDb != null) {
    //   religion.text = religionDb;
    // }
    // if (categoryDb != null) {
    //   category.text = categoryDb;
    // }
    // if (casteDb != null) {
    //   caste.text = casteDb;
    // }
    // if (nationalityDb != null) {
    //   nationality.text = nationalityDb;
    // }
    return Scaffold(
      body: Center(
        // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset('assets/user.png',
                              width: 100, height: 100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 250.0),

                        // ignore: avoid_unnecessary_containers
                        child: Container(
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                          child: const Text("Edit"),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                        )),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: fullname,
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
                            controller: enroll,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                enroll.text = value;
                              });
                            },
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
                            controller: stdclass,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                stdclass.text = value;
                              });
                            },
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
                        controller: address,
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            address.text = value;
                          });
                        },
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
                      Row(children: [
                        Expanded(
                            child: TextFormField(
                          controller: phone,
                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                              phone.text = value;
                            });
                          },
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
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Gender',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            value: selectedScene,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            style: const TextStyle(color: Colors.blue),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedScene = newValue!;
                              });
                            },
                            isExpanded: false,
                            items: genderList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: intialdateval,
                        style: const TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                          labelText: 'Date Of Birth',
                          suffixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onTap: () {
                          _selectDate();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value!.isEmpty || value.isEmpty) {
                            return 'Choose Date';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: email,
                        autofocus: true,
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
                            controller: religion,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                religion.text = value;
                              });
                            },
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
                            controller: category,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                category.text = value;
                              });
                            },
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
                            controller: caste,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                caste.text = value;
                              });
                            },
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
                            controller: nationality,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                nationality.text = value;
                              });
                            },
                            style: const TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                              labelText: 'Nationality',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: deprecated_member_use
                            RaisedButton(
                              child: const Text('Save'),
                              color: Colors.blue.shade600,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  updatestudentdetails(
                                      enroll.text,
                                      stdclass.text,
                                      address.text,
                                      phone.text,
                                      selectedScene,
                                      intialdateval.text,
                                      religion.text,
                                      category.text,
                                      caste.text,
                                      nationality.text,
                                      context);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        intialdateval.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }
}
