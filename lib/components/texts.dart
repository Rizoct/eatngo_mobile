// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String titleText;
  const MainTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
          fontSize: 25, letterSpacing: 4, fontWeight: FontWeight.bold),
    );
  }
}

class ContentTitle extends StatelessWidget {
  final String title;
  const ContentTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ContentSubtitle extends StatelessWidget {
  final String title;
  const ContentSubtitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
    );
  }
}

class RichTextBoldTail extends StatelessWidget {
  final String nonBold;
  final String bold;
  const RichTextBoldTail(
      {super.key, required this.nonBold, required this.bold});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: nonBold,
        style: TextStyle(color: Colors.black, fontSize: 16),
        children: <TextSpan>[
          TextSpan(
              text: bold,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
