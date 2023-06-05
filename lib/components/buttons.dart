// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String ButtonText;
  final VoidCallback onPressed;
  const PrimaryButton(
      {super.key, required this.ButtonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)))),
            child: Text(
              ButtonText,
              style: TextStyle(fontSize: 19),
            )),
      ),
    );
  }
}

class SecondayButton extends StatelessWidget {
  final String ButtonText;
  final VoidCallback onPressed;
  const SecondayButton(
      {super.key, required this.ButtonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo.shade50),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)))),
            child: Text(
              ButtonText,
              style: TextStyle(color: Colors.indigo, fontSize: 19),
            )),
      ),
    );
  }
}

class AnimatedPrimaryButton extends StatelessWidget {
  final String ButtonText;

  const AnimatedPrimaryButton({super.key, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.indigo,
            border: Border.all(color: Colors.black)),
        child: Center(
            child: Text(ButtonText,
                style: TextStyle(fontSize: 19, color: Colors.white))));
  }
}

class AnimatedSecondaryButton extends StatelessWidget {
  final String ButtonText;

  const AnimatedSecondaryButton({super.key, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.indigo.shade50,
            border: Border.all(color: Colors.black)),
        child: Center(
            child: Text(ButtonText,
                style: TextStyle(fontSize: 19, color: Colors.indigo))));
  }
}

class OrderButton extends StatelessWidget {
  final String ButtonText;
  final VoidCallback onPressed;
  const OrderButton(
      {super.key, required this.ButtonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)))),
          child: Text(
            ButtonText,
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
