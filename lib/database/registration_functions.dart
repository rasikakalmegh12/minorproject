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

  StudentModel studentModel = StudentModel();
  studentModel.uid = user!.uid;
  studentModel.email = user.email;
  studentModel.fullname = name;

  await firebaseFirestore
      .collection("students")
      .doc(user.uid)
      .set(studentModel.toMap());

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
    String enroll,
    String stdclass,
    String address,
    String phone,
    String gender,
    String dob,
    String religion,
    String category,
    String caste,
    String nationality,
    BuildContext context) async {
  // calling firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  StudentModel studentModel = StudentModel();
  studentModel.uid = user!.uid;
  studentModel.enroll = enroll;
  studentModel.stdclass = stdclass;
  studentModel.address = address;
  studentModel.phone = phone;
  studentModel.gender = gender;
  studentModel.dob = dob;
  studentModel.religion = religion;
  studentModel.category = category;
  studentModel.caste = caste;
  studentModel.nationality = nationality;

  await firebaseFirestore
      .collection("students")
      .doc(user.uid)
      .update(studentModel.toMap());

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Details Updated Successfully '),
    ),
  );

  Navigator.pushAndRemoveUntil((context),
      MaterialPageRoute(builder: (context) => const Login()), (route) => false);
}
