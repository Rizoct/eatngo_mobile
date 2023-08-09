// ignore_for_file: prefer_const_constructors

import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_vieworder/tabs_vieworder/order_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:money_formatter/money_formatter.dart';
import 'dart:developer';

class TabOrderList extends StatefulWidget {
  final Map userData;
  const TabOrderList({super.key, required this.userData});

  @override
  State<TabOrderList> createState() => _TabOrderListState();
}

class _TabOrderListState extends State<TabOrderList> {
  List transactionData = [];
  List checkOutData = [];
  double total = 0;
  MoneyFormatter fmfTotal = MoneyFormatter(amount: 0);

  Future getOrder(int i) async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/view_order.php');
    try {
      response = await http.post(uri, body: {
        'transactionId': transactionData[i]['transactionId'],
      });
      if (response.statusCode == 200) {
        setState(() {
          transactionData[i]['orderList'] = json.decode(response.body);
          log(transactionData.toString());
        });
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: '${response.statusCode}',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print(e);
      return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: '$e',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  Future getTransaction() async {
    print(
      widget.userData['customerId'],
    );
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/view_transaction.php');
    try {
      response = await http.post(uri, body: {
        'customerId': '',
        'restaurantId': widget.userData['restaurantId'],
        'status': 'pending',
      });
      if (response.statusCode == 200) {
        setState(() {
          transactionData = json.decode(response.body);
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
        for (int i = 0; i < transactionData.length; i++) {
          getOrder(i);
        }
      }

      setState(() {
        total = double.parse(transactionData[0]['total_cost']);
        fmfTotal = MoneyFormatter(amount: total);
      });
    } catch (e) {}
  }

  @override
  void initState() {
    getTransaction();
    super.initState();
  }

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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: transactionData.length,
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
                              offset:
                                  Offset(2, 8), // changes position of shadow
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
                                      transactionData[index]['name'],
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
                                                  OrderDetailsPage(
                                                    transactionData:
                                                        transactionData[index],
                                                  )));
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 40,
                                    )),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  child: SizedBox(
                                      height: 150,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: transactionData[index]
                                                ['orderList']
                                            .length,
                                        itemBuilder: (BuildContext context,
                                            int indexNew) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    spreadRadius: 2,
                                                    blurRadius: 4,
                                                    offset: Offset(2,
                                                        8), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12),
                                                    child: Text(
                                                        '${transactionData[index]['orderList'][indexNew]['itemName']}'),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.indigo,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8))),
                                                    width: 40,
                                                    height: double.infinity,
                                                    child: Center(
                                                      child: Text(
                                                        '${transactionData[index]['orderList'][indexNew]['itemQuantity']}x',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ))),
                            ],
                          ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
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
                                        bold: transactionData[index]['status'])
                                  ],
                                ),
                              )),
                        ]),
                      ),
                    );
                  }),
            ),
            (transactionData.isEmpty)
                ? Center(
                    child: Text('No Data'),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
