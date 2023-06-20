// ignore_for_file: prefer_const_constructors

import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_vieworder/tabs_vieworder/order_details.dart';
import 'package:flutter/material.dart';

class TabOrderList extends StatefulWidget {
  const TabOrderList({super.key});

  @override
  State<TabOrderList> createState() => _TabOrderListState();
}

class _TabOrderListState extends State<TabOrderList> {
  List data = [
    {
      'custName': 'Rizky Octavian Dwipratama',
      'orderStatus': 'Accepted',
      'orderList': [
        {'foodName': 'Mie Setan', 'quantity': 2},
        {'foodName': 'Mie Iblis', 'quantity': 1},
      ]
    },
    {
      'custName': 'Yutaro Tanaka',
      'orderStatus': 'Pending',
      'orderList': [
        {'foodName': 'Mie Setan', 'quantity': 2},
        {'foodName': 'Mie Iblis', 'quantity': 1},
        {'foodName': 'Mie Coklat', 'quantity': 1},
        {'foodName': 'Es Teh', 'quantity': 1},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AnimatedSearchBar(
            searchDecoration: InputDecoration(
              hintText: "Search",
              alignLabelWithHint: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
            searchStyle: TextStyle(color: Colors.white),
            label: "Search Order Here",
            labelStyle: TextStyle(fontSize: 17),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(2, 8), // changes position of shadow
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data[index]['custName'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              OrderDetailsPage()));
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: data[index]['orderList'].length,
                                itemBuilder:
                                    (BuildContext context, int indexNew) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: Offset(2,
                                                8), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                                '${data[index]['orderList'][indexNew]['foodName']}'),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.indigo,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8))),
                                            width: 40,
                                            height: double.infinity,
                                            child: Center(
                                              child: Text(
                                                '${data[index]['orderList'][indexNew]['quantity']}x',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(19),
                                  bottomRight: Radius.circular(19))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.report,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                RichTextBoldTailWhite(
                                    nonBold: 'Order Status : ',
                                    bold: data[index]['orderStatus'])
                              ],
                            ),
                          )),
                    ]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
