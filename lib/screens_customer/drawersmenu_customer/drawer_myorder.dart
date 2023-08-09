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

class DrawerMyOrderPage extends StatefulWidget {
  final Map<dynamic, dynamic> userData;
  const DrawerMyOrderPage({super.key, required this.userData});

  @override
  State<DrawerMyOrderPage> createState() => _DrawerMyOrderPageState();
}

class _DrawerMyOrderPageState extends State<DrawerMyOrderPage> {
  int totalCost = 0;
  double total = 0;
  MoneyFormatter fmfTotal = MoneyFormatter(amount: 0);

  List checkOutData = [];
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

  @override
  void initState() {
    getTransaction();
    // TODO: implement initState
    super.initState();
  }

  Future getTransaction() async {
    print(
      widget.userData['customerId'],
    );
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/view_transaction.php');
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
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Something went wrong',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      if (transactionData.isNotEmpty) {
        getOrder();
      }

      setState(() {
        total = double.parse(transactionData[0]['total_cost']);
        fmfTotal = MoneyFormatter(amount: total);
      });
    } catch (e) {}
  }

  Future getOrder() async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/view_order.php');
    try {
      response = await http.post(uri, body: {
        'transactionId': transactionData[0]['transactionId'],
      });
      if (response.statusCode == 200) {
        setState(() {
          checkOutData = json.decode(response.body);
          print(checkOutData);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Status'),
      ),
      body: Stack(
        children: [
          (transactionData.isEmpty)
              ? Center(
                  child: Text('Tidak ada Data'),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: RichTextBoldTail(
                                      bold: transactionData[0]['transactionId'],
                                      nonBold: '',
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: RichTextBoldTail(
                                      bold: transactionData[0]['status'],
                                      nonBold: 'Status = ',
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: RichTextBoldTail(
                                      bold: transactionData[0]['order_date']
                                          .toString(),
                                      nonBold: 'Date = ',
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: RichTextBoldTail(
                                      bold: transactionData[0]['queueNumber'],
                                      nonBold: 'Queue Number = ',
                                    )),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5),
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
                                  itemCount: checkOutData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return OrderStatusMenu(
                                      menuName: checkOutData[index]['itemName'],
                                      price: int.parse(
                                          checkOutData[index]['cost']),
                                      orderQuantity: int.parse(
                                          checkOutData[index]['itemQuantity']),
                                      notes: checkOutData[index]['note'],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Cost: '),
                                    Text(
                                      'Rp.${fmfTotal.output.nonSymbol}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
        ],
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
