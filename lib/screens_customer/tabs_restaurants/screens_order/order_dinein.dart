// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/components/buttons.dart';
import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/screens_checkout/checkout_dinein.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class OrderDineInPage extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<dynamic, dynamic> userData;
  const OrderDineInPage(
      {super.key, required this.data, required this.userData});

  @override
  State<OrderDineInPage> createState() => _OrderDineInPageState();
}

class _OrderDineInPageState extends State<OrderDineInPage> {
  List orderList = [];
  bool isOrder = false;
  int counter = 0;

  addQuantityData() {
    for (int i = 0; i < dataMenu.length; i++) {
      setState(() {
        dataMenu[i]["orderQuantity"] = 0;
      });
    }
  }

  @override
  void initState() {
    getMenu();
    super.initState();
    isOrder = false;
  }

  List dataMenu = [];
  Future getMenu() async {
    var response;
    var url = Uri.parse('$ip/API_EatNGo/view_menu.php');
    try {
      response = await http.post(url, body: {
        "restaurant_id": widget.data['restaurantId'],
      });
      if (response.statusCode == 200) {
        setState(() {
          dataMenu = json.decode(response.body);
          addQuantityData();
          print(dataMenu);
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
      setState(() {
        //isLoading = false;
      });
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Error!! Check your connection',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Menu'),
      ),
      bottomNavigationBar: (counter > 0)
          ? BottomAppBar(
              color: Colors.grey[50],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: OrderButton(
                  ButtonText: 'Order',
                  onPressed: () {
                    if (orderList.isNotEmpty) {
                      orderList.clear();
                    }
                    for (int a = 0; a < dataMenu.length; a++) {
                      if (dataMenu[a]['orderQuantity'] != 0) {
                        orderList.add(dataMenu[a]);
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutDineInPage(
                            checkOutData: orderList, userData: widget.userData),
                      ),
                    );
                  },
                ),
              ))
          : null,
      body: GroupedListView<dynamic, String>(
        elements: dataMenu,
        groupBy: (element) => element['categoryName'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['itemName'].compareTo(item2['itemName']),
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
              elevation: 8.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: MenuCardwithAdd(
                  menuName: element['itemName'],
                  imgStr: element['photo_url'],
                  menuPrice: int.parse(element['cost']),
                  orderQuantity: element['orderQuantity'],
                  stock: int.parse(element['stock']),
                  onPressedAdd: () {
                    setState(() {
                      if (element['orderQuantity'] <
                          int.parse(element['stock'])) {
                        isOrder = true;
                        element['orderQuantity']++;
                        counter++;
                      } else if (element['orderQuantity'] ==
                          int.parse(element['stock'])) {
                        Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          msg: 'Jumlah makanan melebihi stok!!',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    });
                  },
                  onPressedReduce: () {
                    setState(() {
                      if (element['orderQuantity'] == 0) {
                        element['isZero'] = true;
                      } else {
                        element['orderQuantity']--;
                        counter--;
                      }
                    });
                  }));
        },
      ),
    );
  }
}

class MenuCardwithAdd extends StatelessWidget {
  final String imgStr;
  final String menuName;
  final int menuPrice;
  final VoidCallback onPressedAdd;
  final VoidCallback onPressedReduce;
  final int orderQuantity;
  final int stock;
  const MenuCardwithAdd(
      {super.key,
      required this.imgStr,
      required this.menuName,
      required this.menuPrice,
      required this.onPressedAdd,
      required this.onPressedReduce,
      required this.orderQuantity,
      required this.stock});

  @override
  Widget build(BuildContext context) {
    int count = orderQuantity;
    MoneyFormatter fmf = MoneyFormatter(amount: menuPrice.toDouble());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 0.5)),
        width: double.infinity,
        height: 120,
        child: Stack(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '$ip/img/restaurant/menu_pict/$imgStr'),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    width: 120,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 100,
                            child: ContentTitle(
                              title: menuName,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ContentSubtitle(
                          title: 'Rp. ${fmf.output.nonSymbol.toString()}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  (count != 0)
                      ? IconButton(
                          onPressed: onPressedReduce, icon: Icon(Icons.remove))
                      : Container(),
                  Text(
                    orderQuantity.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  IconButton(onPressed: onPressedAdd, icon: Icon(Icons.add)),
                ],
              ),
            ]),
            (stock == 0)
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                        child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'Sold Out',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
