import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/database/student_model.dart';
import 'package:schoolsys/database/teacher_model.dart';
import 'package:schoolsys/login.dart';

//Student Registration function
void studentRegistration(String fullname, String email, String password,
    BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    postDetailsToFirestore(fullname, context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Already in use'),
        ),
      );
    }
  }
}

postDetailsToFirestore(String name, BuildContext context) async {
  // calling firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  StudentModel std = StudentModel();
  std.uid = user!.uid;
  std.email = user.email;
  std.fullname = name;

  await firebaseFirestore.collection("students").doc(user.uid).set(std.toMap());

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Account Created succesfully'),
  ));

  Navigator.pushAndRemoveUntil((context),
      MaterialPageRoute(builder: (context) => const Login()), (route) => false);
}

//Teachers Registration

void teacherRegistration(String fullname, String email, String password,
    BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    postTeacherDetailsToFirestore(fullname, context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Already in use'),
        ),
      );
    }
  }
}

postTeacherDetailsToFirestore(String name, BuildContext context) async {
  // calling firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  TeacherModel teacher = TeacherModel();
  teacher.uid = user!.uid;
  teacher.email = user.email;
  teacher.name = name;

  await firebaseFirestore
      .collection("teachers")
      .doc(user.uid)
      .set(teacher.toMap());

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Account Created Successfully please login '),
    ),
  );

  Navigator.pushAndRemoveUntil((context),
      MaterialPageRoute(builder: (context) => const Login()), (route) => false);
}

updatestudentdetails(
    String? name,
    String? stdclass,
    String? enroll,
    String? gender,
    String? email,
    String? caste,
    String? nationality,
    String? mobile,
    String? religion,
    String? category,
    address,
    dob,
    BuildContext context) async {
  // calling firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  StudentModel std = StudentModel();
  std.uid = user!.uid;
  std.email = user.email;
  std.fullname = name;
  std.enroll = enroll;
  std.stdclass = stdclass;
  std.address = address;
  std.phone = mobile;
  std.gender = gender;
  std.dob = dob;
  std.religion = religion;
  std.category = category;
  std.caste = caste;
  std.nationality = nationality;

  // await firebaseFirestore.collection("students").doc(user!.uid).update({
  //   'address': address,
  //   'caste': caste,
  //   'category': category,
  //   'class': stdclass,
  //   'dob': dob,
  //   'enroll': enroll,
  //   'gender': gender,
  //   'nationality': nationality,
  //   'phone': phone,
  //   'religion': religion
  // });
  await firebaseFirestore
      .collection("students")
      .doc(user.uid)
      .update(std.toMap());
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Details Updated Successfully '),
    ),
  );

  Navigator.pushAndRemoveUntil((context),
      MaterialPageRoute(builder: (context) => const Login()), (route) => false);
}
