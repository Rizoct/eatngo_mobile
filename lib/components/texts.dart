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

class TitleMain extends StatelessWidget {
  final String title;
  const TitleMain({super.key, required this.title});

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

class RichTextBoldTailWhite extends StatelessWidget {
  final String nonBold;
  final String bold;
  const RichTextBoldTailWhite(
      {super.key, required this.nonBold, required this.bold});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: nonBold,
        style: TextStyle(color: Colors.white, fontSize: 18),
        children: <TextSpan>[
          (bold == 'accepted')
              ? TextSpan(
                  text: bold,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 67, 221, 146)))
              : (bold == 'pending')
                  ? TextSpan(
                      text: bold,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.yellow))
                  : TextSpan(
                      text: bold,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red))
        ],
      ),
    );
  }
}
