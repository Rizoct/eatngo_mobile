// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/textboxs.dart';
import 'package:flutter/material.dart';

class DrawerProfileRestaurantPage extends StatefulWidget {
  const DrawerProfileRestaurantPage({super.key});

  @override
  State<DrawerProfileRestaurantPage> createState() =>
      _DrawerProfileRestaurantPageState();
}

class _DrawerProfileRestaurantPageState
    extends State<DrawerProfileRestaurantPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = 'Mie Gacoan';
    phoneController.text = '081111111111';
    emailController.text = 'gacoan_malang@gmail.com';
    locationController.text = 'Malang';
    descController.text = 'Mie Pedas no 1 di Indonesia';
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
                    backgroundImage: NetworkImage(
                        'https://i0.wp.com/kliklegal.com/wp-content/uploads/2022/08/Mie-Gacoan-Tak-Bisa-Kantongi-Label-Halal-Benarkah.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textFieldInput('Name', nameController),
                  textFieldInput('Phone', phoneController),
                  textFieldEmail('Email', emailController),
                  textFieldInput('Location', locationController),
                  textFieldInput('Description', descController),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Restaurant Geolocation Point',
                        style: TextStyle(
                            color: Colors.indigo.shade50, fontSize: 24),
                      ),
                    ),
                  ),
                  textFieldGeo('ex: -7.932765081412729, 112.6549294306738'),
                  textFieldGeo('ex: -7.932765081412729, 112.6549294306738'),
                  textFieldGeo('ex: -7.932765081412729, 112.6549294306738'),
                  textFieldGeo('ex: -7.932765081412729, 112.6549294306738'),
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

  Padding textFieldGeo(String hint) {
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

          autofocus: false,
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.location_on),
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

  Padding textFieldEmail(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            setState(() {
              //password = value;
            });
          },
          enabled: false,
          autofocus: false,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.grey,
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
