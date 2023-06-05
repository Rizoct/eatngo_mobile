// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/calculations.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/order_dinein.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);

class OrderStatusPage extends StatefulWidget {
  final bool isFromOrder;
  final List checkOutData;
  const OrderStatusPage(
      {super.key, required this.isFromOrder, required this.checkOutData});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  int totalCost = 0;
  MoneyFormatter fmfTotal = MoneyFormatter(amount: 0);

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
    super.initState();
    totalCost = sum(widget.checkOutData);
    fmfTotal = MoneyFormatter(amount: totalCost.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(title: Text('Order Status')),
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
                              bold: 'TR001',
                              nonBold: '',
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: RichTextBoldTail(
                              bold: 'Pending',
                              nonBold: 'Status = ',
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: RichTextBoldTail(
                              bold: date.toString(),
                              nonBold: 'Date = ',
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: RichTextBoldTail(
                              bold: '3314',
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
                              menuName: widget.checkOutData[index]['name'],
                              price: widget.checkOutData[index]['price'],
                              orderQuantity: widget.checkOutData[index]
                                  ['orderQuantity'],
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
      required this.orderQuantity});

  final String menuName;
  final int price;
  final int orderQuantity;

  @override
  Widget build(BuildContext context) {
    int formattedSingleCost = price;

    int formattedTotalCost = price * orderQuantity;
    MoneyFormatter fmfSingle =
        MoneyFormatter(amount: formattedSingleCost.toDouble());
    MoneyFormatter fmfTotal =
        MoneyFormatter(amount: formattedTotalCost.toDouble());

    return ListTile(
      title: Text(menuName),
      trailing: Text(
          'Rp.${fmfSingle.output.withoutFractionDigits} (Rp.${fmfTotal.output.withoutFractionDigits})',
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${orderQuantity}x'),
    );
  }
}
