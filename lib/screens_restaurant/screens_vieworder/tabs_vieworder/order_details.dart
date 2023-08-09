// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class OrderDetailsPage extends StatefulWidget {
  final Map transactionData;
  const OrderDetailsPage({super.key, required this.transactionData});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

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
                      child: (widget.transactionData['status'] != 'accepted')
                          ? Text(
                              'Cancel Order',
                              style:
                                  TextStyle(color: Colors.indigo, fontSize: 18),
                            )
                          : Text(
                              'Reject Order',
                              style:
                                  TextStyle(color: Colors.indigo, fontSize: 18),
                            )),
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
                    child: (widget.transactionData['status'] == 'accepted')
                        ? Text(
                            'Finish Order',
                            style: TextStyle(fontSize: 18),
                          )
                        : Text(
                            'Accept Order',
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
                      widget.transactionData['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '${widget.transactionData['transactionId']} / ${widget.transactionData['order_date']}',
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
              itemCount: widget.transactionData['orderList'].length,
              itemBuilder: (context, index) {
                return orderCard(context, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding orderCard(BuildContext context, int index) {
    int itemSum = int.parse(
            widget.transactionData['orderList'][index]['cost']) *
        int.parse(widget.transactionData['orderList'][index]['itemQuantity']);

    MoneyFormatter fmfItem = MoneyFormatter(amount: itemSum.toDouble());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.5)),
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
                          widget.transactionData['orderList'][index]
                              ['itemName'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          'Rp.${fmfItem.output.nonSymbol.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                        '${widget.transactionData['orderList'][index]['itemQuantity']}x',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              (widget.transactionData['orderList'][index]['note'] != '')
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
                                widget.transactionData['orderList'][index]
                                    ['note'],
                                style: TextStyle(color: Colors.black),
                              )),
                        ]),
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }
}
