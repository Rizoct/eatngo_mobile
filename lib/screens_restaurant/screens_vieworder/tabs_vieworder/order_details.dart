// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final List data = [
    {
      'foodName': 'Mie Setan',
      'price': 'Rp 12.000',
      'quantity': 2,
      'notes':
          'Yang satu level 5, satu lagi level 10, banyakin ayam gapake sayur, extra cinta'
    },
    {'foodName': 'Mie Iblis', 'price': 'Rp 12.000', 'quantity': 1, 'notes': ''},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: BorderDirectional(top: BorderSide(color: Colors.black))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo.shade100),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.indigo)))),
                    onPressed: () {},
                    child: Text(
                      'Cancel Order',
                      style: TextStyle(color: Colors.indigo, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {},
                    child: Text(
                      'Finish Order',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rizky Octavian Dwipratama',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'TR001 / 01-01-2023, 08:00:00',
                      style: TextStyle(fontSize: 16),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.5)),
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0.5,
                            blurRadius: 4,
                            offset: Offset(0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['foodName'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      data[index]['price'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text('${data[index]['quantity']}x',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          (data[index]['notes'] != '')
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20),
                                      ),
                                      color: Colors.grey.shade50),
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(children: [
                                      Icon(
                                        Icons.report,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                          width: 250,
                                          child: Text(
                                            data[index]['notes'],
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                    ]),
                                  ),
                                )
                              : Container()
                        ],
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
