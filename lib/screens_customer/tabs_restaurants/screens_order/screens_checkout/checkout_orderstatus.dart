// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/calculations.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/order_dinein.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);

class OrderStatusPage extends StatefulWidget {
  final bool isFromOrder;
  final List checkOutData;
  final int totalCost;
  final Map<dynamic, dynamic> userData;
  const OrderStatusPage(
      {super.key,
      required this.isFromOrder,
      required this.checkOutData,
      required this.totalCost,
      required this.userData});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  MoneyFormatter fmfTotal = MoneyFormatter(amount: 0);
  List userData = [];
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
  Future<bool> _willPopCallback() async {
    int count = 0;
    if (widget.isFromOrder) {
      Navigator.of(context).popUntil((_) => count++ >= 6);
    } else {
      Navigator.of(context).pop();
    }
    // await showDialog or Show add banners or whatever
    // then
    return true; // return true if the route to be popped
  }

  @override
  void initState() {
    // TODO: implement initState
    print(jsonEncode(widget.checkOutData));
    print(widget.userData);
    if (widget.isFromOrder) {
      addTransaction();
    }

    super.initState();
    fmfTotal = MoneyFormatter(amount: widget.totalCost.toDouble());
  }

  Future getTransaction() async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/view_transaction.php');
    try {
      response = await http.post(uri, body: {
        'customerId': widget.userData['customerId'],
        'restaurantId': widget.checkOutData[0]['restaurantId'],
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
    } catch (e) {
      return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  Future addTransaction() async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/add_transaction.php');
    try {
      response = await http.post(uri, body: {
        'customerId': widget.userData['customerId'],
        'restaurantId': widget.checkOutData[0]['restaurantId'],
        'orderType': 'dine in',
        'totalCost': widget.totalCost.toString(),
      });
      Fluttertoast.showToast(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: 'Success add transactions',
        toastLength: Toast.LENGTH_SHORT,
      );
      addOrder();
      getTransaction();
    } catch (e) {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  Future addOrder() async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/add_order.php');
    try {
      response = await http.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(widget.checkOutData));
      print(jsonEncode(widget.checkOutData));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          msg: 'Success',
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Error ${response.statusCode}',
          toastLength: Toast.LENGTH_SHORT,
        );
        print(response.statusCode);
      }
    } catch (e) {
      setState(() {
        //isLoading = false;
      });
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
      );
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Status'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
              child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: RichTextBoldTail(
                              bold: transactionData[0]['transactionId'],
                              nonBold: '',
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: RichTextBoldTail(
                              bold: transactionData[0]['status'],
                              nonBold: 'Status = ',
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: RichTextBoldTail(
                              bold: transactionData[0]['order_date'].toString(),
                              nonBold: 'Date = ',
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: RichTextBoldTail(
                              bold: transactionData[0]['queueNumber'],
                              nonBold: 'Queue Number = ',
                            )),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
              child: Container(
                height: 380,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 270,
                      child: ListView.builder(
                          itemCount: widget.checkOutData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderStatusMenu(
                              menuName: widget.checkOutData[index]['itemName'],
                              price:
                                  int.parse(widget.checkOutData[index]['cost']),
                              orderQuantity: widget.checkOutData[index]
                                  ['orderQuantity'],
                              notes: widget.checkOutData[index]['notes'],
                            );

                            /*MenuCardCheckout(
                              imgStr: '',
                              menuName: widget.checkOutData[index]['name'],
                              menuDesc: widget.checkOutData[index]['desc'],
                              menuPrice: widget.checkOutData[index]['price'],
                            );*/
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Cost: '),
                            Text(
                              'Rp.${fmfTotal.output.nonSymbol}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class OrderStatusMenu extends StatelessWidget {
  const OrderStatusMenu(
      {super.key,
      required this.menuName,
      required this.price,
      required this.orderQuantity,
      required this.notes});

  final String menuName;
  final int price;
  final int orderQuantity;
  final String notes;

  @override
  Widget build(BuildContext context) {
    int formattedSingleCost = price;

    int formattedTotalCost = price * orderQuantity;
    MoneyFormatter fmfSingle =
        MoneyFormatter(amount: formattedSingleCost.toDouble());
    MoneyFormatter fmfTotal =
        MoneyFormatter(amount: formattedTotalCost.toDouble());

    return Column(
      children: [
        ListTile(
          title: Text(menuName),
          trailing: Text(
              'Rp.${fmfSingle.output.withoutFractionDigits} (Rp.${fmfTotal.output.withoutFractionDigits})',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${orderQuantity}x'),
        ),
        (notes != '')
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.report,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          notes,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
