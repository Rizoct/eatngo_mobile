// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eatngo_thesis/components/buttons.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/calculations.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/screens_checkout/checkout_orderstatus.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class CheckOutDineInPage extends StatefulWidget {
  final List checkOutData;
  final Map<dynamic, dynamic> userData;
  const CheckOutDineInPage(
      {super.key, required this.checkOutData, required this.userData});

  @override
  State<CheckOutDineInPage> createState() => _CheckOutDineInPageState();
}

class _CheckOutDineInPageState extends State<CheckOutDineInPage> {
  int totalCost = 0;
  MoneyFormatter fmf = MoneyFormatter(amount: 0);
  MoneyFormatter fmfTotal = MoneyFormatter(amount: 0);
  sumTotalCost() {
    for (int i = 0; i < widget.checkOutData.length; i++) {
      int itemCost = int.parse(widget.checkOutData[i]['cost'].toString());
      int itemQuantity = widget.checkOutData[i]['orderQuantity'] as int;

      setState(() {
        totalCost += itemCost * itemQuantity;
      });
    }
  }

  addNotesData() {
    for (int i = 0; i < widget.checkOutData.length; i++) {
      setState(() {
        widget.checkOutData[i]["notes"] = '';
      });
    }
  }

  void updateNotes(int index, String notes) {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    addNotesData();
    sumTotalCost();
    print(widget.checkOutData[0]['cost']);
    fmfTotal = MoneyFormatter(amount: totalCost.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txtctrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.black)),
        height: 110,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Total Cost : ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Rp. ${fmfTotal.output.nonSymbol}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                OrderButton(
                    ButtonText: 'Check out',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Konfirmasi Pesanan'),
                              content: Text('Apakah anda yakin ingin memesan?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Pesanan Disimpan'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  OrderStatusPage(
                                                                    userData: widget
                                                                        .userData,
                                                                    isFromOrder:
                                                                        true,
                                                                    checkOutData:
                                                                        widget
                                                                            .checkOutData,
                                                                    totalCost:
                                                                        totalCost,
                                                                  )));
                                                    },
                                                    child: Text(
                                                      'Ok',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            );
                                          });
                                    },
                                    child: Text('Confirm',
                                        style: TextStyle(fontSize: 18))),
                              ],
                            );
                          });
                    })
              ]),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.checkOutData.length,
          itemBuilder: (BuildContext context, int index) {
            fmf = MoneyFormatter(
                amount:
                    int.parse(widget.checkOutData[index]['cost']).toDouble());
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                width: double.infinity,
                height: 120,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '$ip/img/restaurant/menu_pict/${widget.checkOutData[index]['photo_url']}'),
                                    fit: BoxFit.fill),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            width: 120,
                            height: MediaQuery.of(context).size.height,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ContentSubtitle(
                                  title: widget.checkOutData[index]['itemName'],
                                ),
                                Text(
                                  'Rp.${fmf.output.nonSymbol}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: Text(
                                                    'Tambahkan catatan pada ${widget.checkOutData[index]['itemName']}'),
                                                content: TextFormField(
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: null,
                                                  controller: txtctrl,
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Cancel'),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        widget.checkOutData[
                                                                    index]
                                                                ['notes'] =
                                                            txtctrl.text;
                                                      });
                                                      Navigator.pop(
                                                          context, 'OK');
                                                      txtctrl.text = '';
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.note),
                                        Text(' Notes')
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              '${widget.checkOutData[index]['orderQuantity']}x',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}

//{name: Tempe, group: Makanan, desc: Bukan Tahu, orderQuantity: 2, price: 2000, isZero: true},

class NotesDialog extends StatelessWidget {
  final String itemName;
  const NotesDialog({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Tambahkan catatan pada $itemName'),
      content: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
