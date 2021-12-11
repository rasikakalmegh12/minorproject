// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolsys/database/registration_functions.dart';
import 'package:schoolsys/database/student_model.dart';
import 'package:schoolsys/drawer/drawer.dart';
import 'package:intl/intl.dart';
import 'package:schoolsys/registration/z_student.dart';

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

class MyStudentDetailsFormState extends State<MyStudentDetailsForm>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  late File imageFile;
  Map<String, dynamic>? data;
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController gender = TextEditingController();
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

  // var nameDb;
  // var enrollDb;
  // var emailDb;
  // var phoneDb;
  // var addressDb;
  // var stdclassDb;
  // var religionDb;
  // var categoryDb;
  // var casteDb;
  // var nationalityDb;
  StudentModel studentModel = StudentModel();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // getDataFromFireStore().then((results) {
    //   SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
    //     setState(() {});
    //   });
    // });
    super.initState();
    FirebaseFirestore.instance
        .collection("students")
        .doc(user!.uid)
        .get()
        .then((value) {
      studentModel = StudentModel.fromMap(value.data());
      setState(() {});
    });
  }

  // Future<void> getDataFromFireStore() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var collection = FirebaseFirestore.instance.collection('students');
  //   var docSnapshot = await collection.doc(user!.uid).get();
  //   if (docSnapshot.exists) {
  //     data = docSnapshot.data();
  //     setState(() {
  //       nameDb = data?['fullname'];
  //       emailDb = data?['email'];
  //       enrollDb = data?['enroll'];
  //       phoneDb = data?['phone'];
  //       addressDb = data?['address'];
  //       stdclassDb = data?['stdclass'];
  //       religionDb = data?['religion'];
  //       categoryDb = data?['category'];
  //       casteDb = data?['caste'];
  //       nationalityDb = data?['nationality'];
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              //Profile pic
              Container(
                height: 170.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: ExactAssetImage('assets/user.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 90.0, right: 100.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 25.0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _getFromGallery();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _status ? _getEditIcon() : Container(),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      longTextFormField("Name",
                          studentModel.fullname ?? "Your Name", fullname),
                      const SizedBox(
                        height: 20,
                      ),
                      shortTextField(
                          'Class',
                          'Enrollment Number ',
                          studentModel.stdclass ?? "Your Class",
                          studentModel.enroll ?? "Enrollment number",
                          stdclass,
                          enroll),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 2.0),
                        child: Expanded(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                labelText: 'Gender',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      longTextFormField(
                          "Email", studentModel.email ?? "Your Email", email),
                      const SizedBox(
                        height: 20,
                      ),
                      shortTextField(
                          'Cast',
                          'Nationality',
                          studentModel.caste ?? "Your caste",
                          studentModel.nationality ?? 'Enter Nationality',
                          caste,
                          nationality),
                      const SizedBox(
                        height: 20,
                      ),
                      longTextFormField("Mobile",
                          studentModel.phone ?? "Enter Mobile Number", phone),
                      const SizedBox(
                        height: 20,
                      ),
                      shortTextField(
                          'Religion',
                          'Category',
                          studentModel.religion ?? 'Enter Religion',
                          studentModel.category ?? 'Enter Category',
                          religion,
                          category),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 2.0),
                        child: TextFormField(
                          controller: intialdateval,
                          style: const TextStyle(color: Colors.blue),
                          decoration: const InputDecoration(
                            labelText: 'Date Of Birth',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                            suffixIcon: Icon(Icons.calendar_today),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      longTextFormField("Address",
                          studentModel.address ?? "Enter Address", address),
                      SizedBox(
                        height: 20,
                      ),
                      !_status ? _getActionButtons() : Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Padding shortTextField(
      String title1,
      String title2,
      String hint1,
      String hint2,
      TextEditingController controller1,
      TextEditingController controller2) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  title1,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  title2,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                flex: 2,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TextFormField(
                    controller: controller1,
                    decoration: InputDecoration(hintText: hint1),
                    enabled: !_status,
                    onSaved: (value) {
                      setState(() {
                        controller1.text = value!;
                      });
                    },
                  ),
                ),
                flex: 2,
              ),
              Flexible(
                child: TextFormField(
                  controller: controller2,
                  decoration: InputDecoration(hintText: hint2),
                  enabled: !_status,
                  onSaved: (value) {
                    setState(() {
                      controller2.text = value!;
                    });
                  },
                ),
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding longTextFormField(
      String title, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                  ),
                  onSaved: (value) {
                    setState(() {
                      controller.text = value!;
                    });
                  },
                  enabled: !_status,
                  autofocus: !_status,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          width: 150,
          child: FloatingActionButton(
            child: const Text("Save"),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            onPressed: () async {
              await updatestudentdetails(
                  fullname.text,
                  stdclass.text,
                  enroll.text,
                  selectedScene,
                  email.text,
                  caste.text,
                  nationality.text,
                  phone.text,
                  religion.text,
                  category.text,
                  address.text,
                  intialdateval.text,
                  context);

              setState(() {
                _status = true;
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
        SizedBox(
          width: 150,
          child: FloatingActionButton(
            child: const Text("Cancel"),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: () {
              setState(() {
                _status = true;
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ],
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  _getFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
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


/** 
 *  Scaffold(
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
 * 
*/