import 'package:flutter/material.dart';
import 'package:schoolsys/login.dart';

class Student1 extends StatelessWidget {
  const Student1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Student Registration';
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
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  bool viewPass = true;
  bool confirmViewPass = true;
  final TextEditingController stdName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  final TextEditingController stdEmail = TextEditingController();

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
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: stdName,
                      onSaved: (value) {
                        stdName.text = value!;
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
                      controller: stdEmail,
                      onSaved: (value) {
                        stdEmail.text = value!;
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
                      obscureText: viewPass,
                      onSaved: (value) {
                        password.text = value!;
                      },
                      controller: password,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,20}$");

                        if (value!.isEmpty) {
                          return ("Enter Password");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        labelText: 'Password',
                        suffixIcon: InkWell(
                            child: viewPass
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                viewPass = !viewPass;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: confirmViewPass,
                      controller: confirm,
                      onSaved: (value) {
                        confirm.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Password");
                        }
                        if (value != password.text) {
                          return ("Password Does Not match!");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        suffixIcon: InkWell(
                            child: confirmViewPass
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                confirmViewPass = !confirmViewPass;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
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
