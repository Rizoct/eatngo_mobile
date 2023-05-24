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
        fontSize: 20,
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
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
