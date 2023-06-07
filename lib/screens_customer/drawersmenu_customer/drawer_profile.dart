// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/textboxs.dart';
import 'package:flutter/material.dart';

class DrawerProfilePage extends StatefulWidget {
  const DrawerProfilePage({super.key});

  @override
  State<DrawerProfilePage> createState() => _DrawerProfilePageState();
}

class _DrawerProfilePageState extends State<DrawerProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = 'Rizky Octavian Dwipratama';
    phoneController.text = '081111111111';
    emailController.text = 'rizky.dwipratama@binus.ac.id';
    locationController.text = 'Malang';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Edit Profile')),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 2.0))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {},
              child: Text('Save'),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.indigo.shade700,
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    backgroundImage:
                        AssetImage('assets/images/default-ava.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textFieldInput('Name', nameController),
                  textFieldInput('Phone', phoneController),
                  textFieldInput('Email', emailController),
                  textFieldInput('Location', locationController),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                            color: Colors.indigo.shade50, fontSize: 24),
                      ),
                    ),
                  ),
                  textFieldPassword('Enter your old password'),
                  textFieldPassword('Enter your new password'),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding textFieldInput(String hint, TextEditingController controller) {
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
          controller: controller,
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
