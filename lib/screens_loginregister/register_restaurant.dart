// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_loginregister/login_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRestaurantPage extends StatefulWidget {
  const RegisterRestaurantPage({super.key});

  @override
  State<RegisterRestaurantPage> createState() => _RegisterRestaurantPageState();
}

class _RegisterRestaurantPageState extends State<RegisterRestaurantPage> {
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController respassword = TextEditingController();

  Future register() async {
    setState(() {
      isLoading = true;
    });

    var uri = Uri.parse('$ip/API_EatNGo/register.php');
    final response = await http.post(uri, body: {
      'register_type': 'restaurant',
      'name': name.text,
      'phonenumber': phonenumber.text,
      'email': email.text,
      'location': location.text,
      'password': password.text,
    });

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Sukses Register',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      setState(() {
        isLoading = false;
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', email.text);
      prefs.setString('password', password.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => LoginRestaurantPage()));
    } else {
      print(response.statusCode);
      Fluttertoast.showToast(
        msg: 'Gagal Register',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register as Restaurant')),
      resizeToAvoidBottomInset: true,
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
                  onPressed: () {
                    if (name.text == '' ||
                        phonenumber.text == '' ||
                        email.text == '' ||
                        location.text == '' ||
                        password.text == '' ||
                        respassword.text == '') {
                      Fluttertoast.showToast(
                        msg: 'Harap isi semua form!!',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    } else {
                      register();
                    }
                  },
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
                  textFieldInput('Restaurant Name', name),
                  textFieldInput('Phone Number', phonenumber),
                  textFieldInput('Email', email),
                  textFieldInput('Location', location),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  textFieldPassword('Password', password),
                  textFieldPassword('Re-enter Password', respassword),
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

  Padding textFieldInput(String hint, TextEditingController ctrl) {
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
          controller: ctrl,
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
