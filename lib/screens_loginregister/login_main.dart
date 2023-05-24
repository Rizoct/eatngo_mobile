// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/screens_loginregister/login_customer.dart';
import 'package:eatngo_thesis/screens_loginregister/login_restaurant.dart';
import 'package:eatngo_thesis/screens_loginregister/register_main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:eatngo_thesis/components/buttons.dart';
import 'package:animations/animations.dart';
import 'package:eatngo_thesis/components/buttons.dart';

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
        color: Colors.grey[50]!,
        elevation: 0,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  text: "Don't have an Account?",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      style: TextStyle(color: Colors.indigo),
                      text: ' Click Here!',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterMainPage(),
                              ),
                            ),
                    ),
                  ],
                ),
              )),
        ]),
      ),
      body: Stack(
        children: [
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30.0),
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
                                  ButtonText: 'Login as Customer',
                                ),
                            openBuilder: (context, _) => LoginCustomerPage()),
                      ),
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
                                  ButtonText: 'Login as Restaurant',
                                ),
                            openBuilder: (context, _) => LoginRestaurantPage()),
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
