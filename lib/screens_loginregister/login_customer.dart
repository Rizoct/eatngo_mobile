// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_build_context_synchronously

import 'dart:ui';
import 'package:eatngo_thesis/screens_restaurant/mainmenu_restaurant.dart';
import 'package:http/http.dart' as http;
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/screens_customer/mainmenu_customer.dart';
import 'package:flutter/material.dart';
import 'package:eatngo_thesis/components/textboxs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCustomerPage extends StatefulWidget {
  const LoginCustomerPage({Key? key}) : super(key: key);

  @override
  State<LoginCustomerPage> createState() => _LoginCustomerPageState();
}

class _LoginCustomerPageState extends State<LoginCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  String? emailLogin, password, errormsg;
  bool? error, isLoading;
  List dataUser = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void autoLoginChecker() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('username'));
    if (prefs.getString('username') != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        emailLogin = prefs.getString('username')!;
        password = prefs.getString('password')!;
      });
      login();
    }
  }

  void login() async {
    var response;
    try {
      var url = Uri.parse('$ip/API_EatNGo/login.php');
      print(url);
      response = await http.post(url, body: {
        "email": emailLogin,
        "password": password,
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data["error"]) {
          setState(() {
            isLoading = false;
            error = true;
            errormsg = data['message'];
            Fluttertoast.showToast(
              msg: errormsg!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
            );
          });
        } else {
          if (data["success"]) {
            setState(() {
              error = false;
              isLoading = false;
            });

            Fluttertoast.showToast(
              msg: 'Login Successful',
              backgroundColor: Colors.green,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
            );
            if (data['role'] == 'customer') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainMenuCustomer(
                    data: data,
                  ),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainMenuRestaurant(
                    userData: data,
                  ),
                ),
              );
            }
          } else {
            isLoading = false;
            error = true;
            errormsg = "Something went wrong.";
            Fluttertoast.showToast(
              backgroundColor: Colors.red,
              textColor: Colors.white,
              msg: errormsg!,
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        }
      } else {
        Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: response.statusCode.toString(),
          toastLength: Toast.LENGTH_SHORT,
        );
      }

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', emailLogin!);
      prefs.setString('password', password!);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  void initState() {
    autoLoginChecker();
    errormsg = "";
    error = false;
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo,
                        Colors.grey[50]!,
                      ],
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Login to EatN'Go",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 300,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: ContentTitle(title: 'Log in'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Material(
                                elevation: 10.0,
                                shadowColor: Colors.black,
                                child: TextFormField(
                                  controller: emailController,
                                  onChanged: (value) {
                                    setState(() {
                                      emailLogin = value;
                                    });
                                  },
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 3.0))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Material(
                                elevation: 10.0,
                                shadowColor: Colors.black,
                                child: TextFormField(
                                  controller: passController,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  obscureText: true,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 3.0))),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: SizedBox(
                                  width: 200,
                                  height: 55,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                                    onPressed: () {
                                      if (emailController.text == '' ||
                                          passController.text == '') {
                                        Fluttertoast.showToast(
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          msg:
                                              'Please Fill Your Email and Password',
                                          toastLength: Toast.LENGTH_SHORT,
                                        );
                                      } else {
                                        login();
                                      }
                                    },
                                    child: Text(
                                      'LOG IN',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            isLoading!
                ? Container(
                    color: Colors.grey.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
