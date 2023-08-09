// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_customer/restaurantview_customer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:grouped_list/grouped_list.dart';

class MenuTab extends StatefulWidget {
  final Map<String, dynamic> data;
  final String restaurantname;
  const MenuTab({super.key, required this.data, required this.restaurantname});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  MoneyFormatter fmf = MoneyFormatter(amount: 0);
  List dataMenu = [];

  Future getMenu() async {
    var response;
    var url = Uri.parse('$ip/API_EatNGo/view_menu.php');
    print(url);
    try {
      response = await http.post(url, body: {
        "restaurant_id": widget.data['restaurantId'],
      });
      print(widget.data['restaurantId']);
      if (response.statusCode == 200) {
        setState(() {
          dataMenu = json.decode(response.body);
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
      print(e);
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Error!! Check your connection',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  void initState() {
    getMenu();

    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                }),
            items: dataMenu
                .map((item) => Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                  '$ip/img/restaurant/menu_pict/${dataMenu[dataMenu.indexOf(item)]['photo_url']}',
                                  fit: BoxFit.cover,
                                  width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    dataMenu[dataMenu.indexOf(item)]
                                        ['itemName'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ))
                .toList(),
          ),
        ),
        GroupedListView<dynamic, String>(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          elements: dataMenu,
          groupBy: (element) => element['categoryName'],
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) =>
              item1['itemName'].compareTo(item2['itemName']),
          order: GroupedListOrder.ASC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: ContentTitle(
                      title: value,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              )),
          itemBuilder: (c, element) {
            return MenuCard(
                imgStr: (element['photo_url'] == null)
                    ? "No_Image_Available.jpg"
                    : '${element['photo_url']}',
                menuDesc: element['itemDescription'],
                menuName: element['itemName'],
                menuPrice: int.parse(element['cost']));
          },
        ),
      ],
    ));
  }
}

/*
return MenuCard(
              imgStr: (dataMenu[index]['photo_url'] == null)
                  ? "No_Image_Available.jpg"
                  : '${dataMenu[index]['photo_url']}',
              menuDesc: dataMenu[index]['itemDescription'],
              menuName: dataMenu[index]['itemName'],
              menuPrice: int.parse(dataMenu[index]['cost']),
            );*/