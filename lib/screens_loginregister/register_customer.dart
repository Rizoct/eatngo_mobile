// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RegisterCustomerpage extends StatefulWidget {
  const RegisterCustomerpage({super.key});

  @override
  State<RegisterCustomerpage> createState() => _RegisterCustomerpageState();
}

class _RegisterCustomerpageState extends State<RegisterCustomerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register as Customer')),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  text: "Already have an Account?",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        style: TextStyle(color: Colors.indigo),
                        text: ' Click Here!',
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              )),
        ]),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(),
          ),
          ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.indigo.shade700,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  textFieldInput('Name'),
                  textFieldInput('Phone Number'),
                  textFieldInput('Email'),
                  textFieldInput('Location'),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  textFieldPassword('Password'),
                  textFieldPassword('Re-enter Password'),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }

  Padding textFieldInput(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              //emailLogin = value;
            });
          },
          autofocus: false,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.white, width: 3.0))),
        ),
      ),
    );
  }

  Padding textFieldPassword(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          //controller: passController,
          onChanged: (value) {
            setState(() {
              //password = value;
            });
          },
          obscureText: true,
          autofocus: false,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.white, width: 3.0))),
        ),
      ),
    );
  }
}
