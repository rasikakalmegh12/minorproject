import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:schoolsys/main.dart';
import 'package:schoolsys/registration/parent1.dart';

class Parent extends StatelessWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Parent Registration';
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
  final formkey = GlobalKey<FormState>();

  final TextEditingController fullname = TextEditingController();
  final TextEditingController enrollNo = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneno = TextEditingController();
  final TextEditingController guardian = TextEditingController();

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
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: fullname,
                      onSaved: (value) {
                        fullname.text = value!;
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
                      controller: email,
                      onSaved: (value) {
                        email.text = value!;
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
                      controller: phoneno,
                      onSaved: (value) {
                        phoneno.text = value!;
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
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: enrollNo,
                      onSaved: (value) {
                        enrollNo.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[a-zA-Z0-9]*$");

                        if (value!.isEmpty) {
                          return ("Enter Your Enrollment Number");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Enrollment Number");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Students Enrollment Number',
                        labelText: 'Students Enrollment Number',
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
                      controller: guardian,
                      onSaved: (value) {
                        guardian.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[a-zA-Z ]*$");

                        if (value!.isEmpty) {
                          return ("Enter Guardian Detail");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Guardian Detail");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Mother , Father ,Others',
                        labelText: 'Relation with Student',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: const Text('Next'),
                            color: Colors.blue.shade600,
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Parent1()));
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
