// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/screens_customer/mainmenu_customer.dart';
import 'package:eatngo_thesis/screens_loginregister/login_main.dart';
import 'package:eatngo_thesis/screens_loginregister/register_customer.dart';
import 'package:eatngo_thesis/screens_loginregister/register_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'SFPro',
      ),
      home: MainMenuCustomer(),
    );
  }
}
