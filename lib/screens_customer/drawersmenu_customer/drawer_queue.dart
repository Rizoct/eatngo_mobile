// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerQueuePage extends StatefulWidget {
  const DrawerQueuePage({super.key});

  @override
  State<DrawerQueuePage> createState() => _DrawerQueuePageState();
}

class _DrawerQueuePageState extends State<DrawerQueuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Queue Number'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Queue Number',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Text('12',
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Your Queue Number',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: Text('15',
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
