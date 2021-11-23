import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Nishu extends StatefulWidget {
  const Nishu({Key? key}) : super(key: key);

  @override
  _NishuState createState() => _NishuState();
}

class _NishuState extends State<Nishu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: ContactUs(
        cardColor: Colors.blue.shade200,
        textColor: Colors.black,
        taglineColor: Colors.black,
        companyName: 'Nisha Bharuka',
        companyColor: Colors.black,
        logo: const AssetImage('assets/Nishu.jpeg'),
        email: 'nishabharuka3@gmail.com',
        phoneNumber: '+919284730612',
        dividerThickness: 2,
        githubUserName: 'NishaBharuka30',
        linkedinURL: 'https://www.linkedin.com/in/nisha-bharuka-4b63aa184/',
        tagLine: 'Flutter Developer',
        instagram: 'nishh6',
      ),
    );
  }
}
