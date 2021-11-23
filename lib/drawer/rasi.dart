import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Rasi extends StatefulWidget {
  const Rasi({Key? key}) : super(key: key);

  @override
  _RasiState createState() => _RasiState();
}

class _RasiState extends State<Rasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: ContactUs(
        cardColor: Colors.blue.shade200,
        textColor: Colors.black,
        taglineColor: Colors.black,
        companyName: 'Rasika Kalmegh',
        companyColor: Colors.black,
        logo: const AssetImage('assets/Rasi.jpeg'),
        email: 'rasikakalmegh01@gmail.com',
        phoneNumber: '+918698082098',
        dividerThickness: 2,
        githubUserName: 'rasikakalmegh12',
        linkedinURL: 'https://www.linkedin.com/in/rasikakalmegh6397a9211/',
        tagLine: 'Flutter Developer',
        instagram: 'rasika_Kalmegh',
      ),
    );
  }
}
