// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/functions/connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DrawerQueuePage extends StatefulWidget {
  final Map userData;
  const DrawerQueuePage({super.key, required this.userData});

  @override
  State<DrawerQueuePage> createState() => _DrawerQueuePageState();
}

class _DrawerQueuePageState extends State<DrawerQueuePage> {
  bool isOrdering = false;
  List transactionData = [
    {
      "transactionId": "",
      "queueNumber": "",
      "customerId": "",
      "restaurantId": "",
      "order_date": "",
      "order_type": "",
      "total_cost": "",
      "status": ""
    }
  ];
  List currentQueue = [
    {
      "currentQueue": '',
    }
  ];

  Future getQueue() async {
    var response;
    var uri =
        Uri.http(ip, '/API_EatNGo/view_restaurantQueue.php', {'q': '{http}'});
    try {
      response = await http.post(uri, body: {
        'restaurantId': transactionData[0]['restaurantId'],
      });
      if (response.statusCode == 200) {
        setState(() {
          currentQueue = json.decode(response.body);
        });
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Something went wrong',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      if (transactionData.isNotEmpty) {
        setState(() {
          isOrdering = true;
        });
      }
    } catch (e) {
      return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    print(transactionData);
  }

  Future getTransaction() async {
    var response;
    var uri = Uri.http(ip, '/API_EatNGo/view_transaction.php', {'q': '{http}'});
    try {
      response = await http.post(uri, body: {
        'customerId': widget.userData['customerId'],
        'restaurantId': '',
        'status': 'pending',
      });
      if (response.statusCode == 200) {
        setState(() {
          transactionData = json.decode(response.body);
        });
        getQueue();
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Something went wrong',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      if (transactionData.isNotEmpty) {
        setState(() {
          isOrdering = true;
        });
      }
    } catch (e) {
      return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    print(transactionData);
  }

  @override
  void initState() {
    print(widget.userData);
    getTransaction();

    // TODO: implement initState
    super.initState();
  }

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
                    child: Text(currentQueue[0]['currentQueue'],
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
                    child: Text(transactionData[0]['queueNumber'],
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
