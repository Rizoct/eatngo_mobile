// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class MenuEditPage extends StatefulWidget {
  final String itemId;
  final String imgStr;
  final String menuName;
  final String menuDesc;
  final int menuPrice;
  final int stock;
  final Map dataCategory;
  const MenuEditPage(
      {super.key,
      required this.itemId,
      required this.imgStr,
      required this.menuName,
      required this.menuDesc,
      required this.menuPrice,
      required this.stock,
      required this.dataCategory});

  @override
  State<MenuEditPage> createState() => _MenuEditPageState();
}

class _MenuEditPageState extends State<MenuEditPage> {
  String itemId = '';
  String imgStr = '';
  String menuName = '';
  String menuDesc = '';
  int menuPrice = 0;
  int stock = 0;

  List<String> items = [
    'Available',
    'Sold out',
  ];
  @override
  void initState() {
    print(widget.dataCategory);
    itemId = widget.itemId;
    imgStr = widget.imgStr;
    menuName = widget.menuName;
    menuDesc = widget.menuDesc;
    menuPrice = widget.menuPrice;
    stock = widget.stock;
    super.initState();
  }

  Future updateMenu() async {
    var response;
    var url = Uri.http(ip, '/API_EatNGo/edit_menu.php', {'q': '{http}'});
    try {
      response = await http.post(url, body: {
        'itemId': itemId,
        'name': menuName,
        'desc': menuDesc,
        'price': menuPrice.toString(),
        'stock': stock.toString(),
      });

      if (response.statusCode == 200) {
        return Fluttertoast.showToast(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          msg: 'Success',
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Something went wrong',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Edit Menu')),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
            onPressed: () {
              updateMenu();
            },
            child: Text('Save'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.indigo,
                        border: Border.all(color: Colors.black, width: 1.5)),
                    child: Center(
                      child: Text(
                        'Current Category = ${widget.dataCategory['categoryName']}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Photo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://$ip/API_EatNGo/restaurant/menu_pict/${widget.imgStr}'),
                          fit: BoxFit.fill)),
                ),
                Divider(
                  height: 40,
                ),
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      menuName = value;
                    });
                  },
                  initialValue: widget.menuName,
                  decoration: InputDecoration(hintText: 'ex: Nasi Goreng'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      menuDesc = value;
                    });
                  },
                  initialValue: widget.menuDesc,
                  decoration:
                      InputDecoration(hintText: 'ex: Nasi Goreng tradisional'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Price',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      menuPrice = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  initialValue: widget.menuPrice.toString(),
                  decoration: InputDecoration(hintText: 'ex: 10000'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Stock',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      stock = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  initialValue: widget.stock.toString(),
                  decoration: InputDecoration(hintText: 'ex: 10000'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
