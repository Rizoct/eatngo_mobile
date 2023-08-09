// ignore_for_file: prefer_const_constructors

import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/screens_category/screens_menu/menu_add.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class MenuCategoryPage extends StatefulWidget {
  final Map dataCategory;
  const MenuCategoryPage({super.key, required this.dataCategory});

  @override
  State<MenuCategoryPage> createState() => _MenuCategoryPageState();
}

class _MenuCategoryPageState extends State<MenuCategoryPage> {
  List menu = [];
  @override
  void initState() {
    getCategory();
    // TODO: implement initState
    super.initState();
  }

  Future getCategory() async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/view_category_menu.php');
    try {
      response = await http
          .post(uri, body: {"categoryId": widget.dataCategory['categoryId']});
      if (response.statusCode == 200) {
        setState(() {
          menu = json.decode(response.body);
          print(menu);
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
      print(e);
      Fluttertoast.showToast(
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
        title: Text('Makanan'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: AnimatedSearchBar(
                searchDecoration: InputDecoration(
                  hintText: "Search",
                  alignLabelWithHint: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                closeIcon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                searchIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                searchStyle: TextStyle(color: Colors.white),
                label: "Search for your menu",
                labelStyle: TextStyle(fontSize: 17, color: Colors.white),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MenuAddPage()));
            },
            child: Text('Add Menu'),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return EditMenuCard(
            itemId: menu[index]['itemId'],
            dataCategory: widget.dataCategory,
            imgStr: menu[index]['photo_url'],
            menuDesc: menu[index]['itemDescription'],
            menuName: menu[index]['itemName'],
            menuPrice: int.parse(menu[index]['cost']),
            stock: int.parse(menu[index]['stock']),
          );
        },
      ),
    );
  }
}
