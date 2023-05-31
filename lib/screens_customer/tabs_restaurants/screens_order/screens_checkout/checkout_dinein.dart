// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eatngo_thesis/components/buttons.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/calculations.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/screens_checkout/checkout_orderstatus.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class CheckOutDineInPage extends StatefulWidget {
  final List checkOutData;
  const CheckOutDineInPage({super.key, required this.checkOutData});

  @override
  State<CheckOutDineInPage> createState() => _CheckOutDineInPageState();
}

class _CheckOutDineInPageState extends State<CheckOutDineInPage> {
  int totalCost = 0;
  MoneyFormatter fmf = MoneyFormatter(amount: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalCost = sum(widget.checkOutData);
    fmf = MoneyFormatter(amount: totalCost.toDouble());
  }

  @override
  Widget build(BuildContext context) {
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
                      'Rp. ' + fmf.output.nonSymbol.toString(),
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
                                                                    isFromOrder:
                                                                        true,
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
            return MenuCardCheckout(
              imgStr: '',
              menuName: widget.checkOutData[index]['name'],
              menuDesc: widget.checkOutData[index]['desc'],
              menuPrice: widget.checkOutData[index]['price'],
              orderQuantity: widget.checkOutData[index]['orderQuantity'],
            );
          }),
    );
  }
}

//{name: Tempe, group: Makanan, desc: Bukan Tahu, orderQuantity: 2, price: 2000, isZero: true},

class MenuCardCheckout extends StatelessWidget {
  final String imgStr;
  final String menuName;
  final String menuDesc;
  final int menuPrice;
  final int orderQuantity;
  const MenuCardCheckout({
    super.key,
    required this.imgStr,
    required this.menuName,
    required this.menuDesc,
    required this.menuPrice,
    required this.orderQuantity,
  });

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf = MoneyFormatter(amount: menuPrice.toDouble());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 0.5)),
        width: double.infinity,
        height: 120,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0)),
                width: 120,
                height: MediaQuery.of(context).size.height,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ContentSubtitle(
                        title: menuName,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Rp.${fmf.output.nonSymbol}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
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
                  '${orderQuantity}x',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
