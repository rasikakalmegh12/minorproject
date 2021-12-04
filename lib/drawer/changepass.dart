import 'package:flutter/material.dart';
import 'package:schoolsys/database/login_function.dart';
import 'package:schoolsys/login.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: MyCustomForm(),
      ),
    );
  }
}

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
  bool currentPass = true;
  bool newPass = true;
  bool confirmNewPass = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController newpass = TextEditingController();
  final TextEditingController confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
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
                    SizedBox(
                      height: 210,
                      child: Image.asset(
                        'assets/changepass.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: email,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Your Email!");
                        }
                        //Regular Expression for email validation
                        if (!RegExp(
                                r"^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$")
                            .hasMatch(value)) {
                          return ("Enter A Valid Email");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSaved: (value) {
                        email.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: currentPass,
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
                        hintText: 'Enter current Password',
                        suffixIcon: InkWell(
                            child: currentPass
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                currentPass = !currentPass;
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
                      obscureText: newPass,
                      onSaved: (value) {
                        password.text = value!;
                      },
                      controller: newpass,
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
                        hintText: 'Enter new Password',
                        suffixIcon: InkWell(
                            child: newPass
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                newPass = !newPass;
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
                      obscureText: confirmNewPass,
                      controller: confirm,
                      onSaved: (value) {
                        confirm.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Password");
                        }
                        if (value != newpass.text) {
                          return ("Password Does Not match!");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: InkWell(
                            child: confirmNewPass
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                confirmNewPass = !confirmNewPass;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200.0,
                            height: 50.0,
                            child:
                                // ignore: deprecated_member_use
                                RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              color: Colors.blue,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  changePassword(email.text, password.text,
                                      newpass.text, context);
                                }
                              },
                            ),
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
