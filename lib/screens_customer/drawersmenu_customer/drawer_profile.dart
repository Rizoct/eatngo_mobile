// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/textboxs.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DrawerProfilePage extends StatefulWidget {
  final Map data;
  const DrawerProfilePage({super.key, required this.data});

  @override
  State<DrawerProfilePage> createState() => _DrawerProfilePageState();
}

class _DrawerProfilePageState extends State<DrawerProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();

  File? imageFile;
  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 20,
    );

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  void initState() {
    print(widget.data);
    // TODO: implement initState
    super.initState();
    nameController.text = widget.data['name'];
    phoneController.text = widget.data['contact_number'];
    emailController.text = widget.data['email'];
    locationController.text = widget.data['address'];
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
                  InkWell(
                    onTap: () {
                      _getFromCamera();
                    },
                    child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black,
                        backgroundImage: (imageFile == null)
                            ? AssetImage('assets/images/default-ava.jpg')
                                as ImageProvider
                            : FileImage(imageFile!)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textFieldInput('Name', nameController),
                  textFieldInput('Phone', phoneController),
                  textFieldInputEmail('Email', emailController),
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
                  textFieldPassword('Enter your old password', passController),
                  textFieldPassword(
                      'Enter your new password', repassController),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding textFieldInputEmail(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          enabled: false,
          onChanged: (value) {
            setState(() {
              //emailLogin = value;
            });
          },
          controller: controller,
          autofocus: false,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.grey.shade400,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.white, width: 3.0))),
        ),
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

  Padding textFieldPassword(String hint, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          controller: ctrl,
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
