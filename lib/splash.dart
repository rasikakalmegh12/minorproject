import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/login.dart';
import 'package:schoolsys/preferences_functions.dart';
import 'package:schoolsys/studenthome/stdhome.dart';
import 'package:schoolsys/teacher_home/teachers_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_data.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? loginType;

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  Future _navigatetohome() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser;
    if (user != null) {
      UserData.logintype = (await SharedPreferenceData.getLoginType());
      UserData.name = (await SharedPreferenceData.getName());
      UserData.mail = (await SharedPreferenceData.getEmail());

      if (UserData.logintype == 'Student') {
        await Future.delayed(const Duration(milliseconds: 4000), () {});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StdHome()));
      } else {
        await Future.delayed(const Duration(milliseconds: 4000), () {});
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const TeacherHome()));
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 4000), () {});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/SchoolSYS.gif',
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
