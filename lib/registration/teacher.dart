// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:schoolsys/main.dart';
import 'package:schoolsys/registration/teacher1.dart';

class Teacher extends StatelessWidget {
  const Teacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Teacher Registration';
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
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController tname = TextEditingController();
  final TextEditingController tid = TextEditingController();
  final TextEditingController tEmail = TextEditingController();
  final TextEditingController tPhone = TextEditingController();
  final TextEditingController tGender = TextEditingController();
  final TextEditingController tQualification = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: tname,
                      onSaved: (value) {
                        tname.text = value!;
                      },
                      validator: (value) {
                        RegExp regex =
                            RegExp(r"^(?=.*[a-z])(?=.*[A-Z]).{3,50}$");

                        if (value!.isEmpty) {
                          return ("Enter Your Name");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Name");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        labelText: 'Fullname',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: tid,
                      onSaved: (value) {
                        tid.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[a-zA-Z0-9]*$");

                        if (value!.isEmpty) {
                          return ("Enter Your ID");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid ID");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your ID Number',
                        labelText: 'ID Number',
                        suffixIcon: const Icon(Icons.format_list_numbered),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: tEmail,
                      onSaved: (value) {
                        tEmail.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Your Email!");
                        }
                        if (!RegExp(
                                r"^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$")
                            .hasMatch(value)) {
                          return ("Enter A Valid Email");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        labelText: 'Email',
                        suffixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: tPhone,
                      onSaved: (value) {
                        tPhone.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[0-9]*$");

                        if (value!.isEmpty) {
                          return ("Enter Phone Number");
                        }
                        if (value.length < 10) {
                          return ("Phone number consist 10 digits!");
                        }
                        if (value.length > 10) {
                          return ("Phone number cannot be greater than 10 digits");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Phone Number");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        labelText: 'Phone number',
                        suffixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: tGender,
                      onSaved: (value) {
                        tGender.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Gender");
                        }
                        if (value != "Male" && value != "Female") {
                          return ("Enter Valid Gender");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Male Female or Others',
                        labelText: 'Gender',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: tQualification,
                      onSaved: (value) {
                        tQualification.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[a-zA-Z ]*$");

                        if (value!.isEmpty) {
                          return ("Enter Qualification Details");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Qualification Detail");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Highest Qualification',
                        labelText: 'Highest Qualification',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: const Text('Next'),
                            color: Colors.blue.shade600,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Teacher1()));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
