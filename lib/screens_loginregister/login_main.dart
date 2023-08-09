// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_loginregister/login_customer.dart';
import 'package:eatngo_thesis/screens_loginregister/login_restaurant.dart';
import 'package:eatngo_thesis/screens_loginregister/register_main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:eatngo_thesis/components/buttons.dart';
import 'package:animations/animations.dart';
import 'package:eatngo_thesis/components/buttons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({super.key});

  @override
  State<LoginMainPage> createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Column(mainAxisSize: MainAxisSize.min, children: []),
      ),
      body: Stack(
        children: [
          /*
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg-alt.jpg'),
                      fit: BoxFit.fill))),*/
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.indigo,
                Colors.grey[50]!,
              ],
            )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                CircleAvatar(
                  radius: 75,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child:
                          Image.asset("assets/images/logo-no-background.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 5.0),
                        child: OpenContainer(
                            transitionType: ContainerTransitionType.fadeThrough,
                            closedShape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            transitionDuration: Duration(seconds: 1),
                            closedBuilder: (context, _) =>
                                AnimatedPrimaryButton(
                                  ButtonText: 'Login',
                                ),
                            openBuilder: (context, _) => LoginCustomerPage()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 5.0),
                        child: OpenContainer(
                            transitionType: ContainerTransitionType.fadeThrough,
                            closedShape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            transitionDuration: Duration(seconds: 1),
                            closedBuilder: (context, _) =>
                                AnimatedSecondaryButton(
                                  ButtonText: 'Register',
                                ),
                            openBuilder: (context, _) => RegisterMainPage()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
