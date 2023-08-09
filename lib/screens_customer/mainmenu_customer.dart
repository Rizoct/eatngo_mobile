// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/drawers/maindrawer.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_customer/restaurantview_customer.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/screens_checkout/checkout_orderstatus.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class MainMenuCustomer extends StatefulWidget {
  final Map data;
  const MainMenuCustomer({super.key, required this.data});

  @override
  State<MainMenuCustomer> createState() => _MainMenuCustomerState();
}

class _MainMenuCustomerState extends State<MainMenuCustomer> {
  List dataRestoran = [];
  List dataRestoranSearch = [];
  bool isLoading = false;

  Future getRestaurantSearch() async {
    var response;
    var url = Uri.parse('$ip/API_EatNGo/view_restaurant.php');
    setState(() {
      isLoading = true;
    });
    try {
      response = await http.post(url, body: {
        "search": searchText,
      });
      if (response.statusCode == 200) {
        setState(() {
          dataRestoranSearch = json.decode(response.body);
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
    setState(() {
      isLoading = false;
    });
  }

  Future getRestaurant() async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/view_restaurant.php');
    setState(() {
      isLoading = true;
    });
    try {
      response = await http.post(uri, body: {
        "search": '',
      });
      if (response.statusCode == 200) {
        setState(() {
          dataRestoran = json.decode(response.body);
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
    setState(() {
      isLoading = false;
    });
  }

  String searchText = "";

  @override
  void initState() {
    print(widget.data);
    getRestaurant();
    getRestaurantSearch();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AnimatedSearchBar(
            searchDecoration: InputDecoration(
              hintText: "Search",
              alignLabelWithHint: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
            searchStyle: TextStyle(color: Colors.white),
            label: "Search Something Here",
            labelStyle: TextStyle(fontSize: 17),
            onChanged: (value) {
              setState(() {
                searchText = value;
                getRestaurantSearch();
              });
            },
          ),
        ),
        drawer: MainDrawer(data: widget.data),
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: dataRestoran
                        .map((item) => Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(
                                          '$ip/img/restaurant/profile_pict/${item['photo_url']}',
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
                                            '${item['name']}',
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
                Divider(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ContentTitle(
                      title: 'Browse Restaurant',
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: dataRestoranSearch.length,
                  itemBuilder: (context, index) {
                    return RestaurantMainCard(
                      imgStr: dataRestoranSearch[index]['photo_url'],
                      restaurantName: dataRestoranSearch[index]['name'],
                      restaurantAddress: dataRestoranSearch[index]['address'],
                      restaurantRating: double.parse(
                        dataRestoranSearch[index]['rating'],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantViewCustomer(
                              userData: widget.data,
                              imgStr: dataRestoranSearch[index]['photo_url'],
                              restaurantName: dataRestoranSearch[index]['name'],
                              restaurantAddress: dataRestoranSearch[index]
                                  ['address'],
                              restaurantRating: double.parse(
                                  dataRestoranSearch[index]['rating']),
                              restaurantDesc: dataRestoranSearch[index]
                                  ['description'],
                              data: dataRestoranSearch[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            isLoading
                ? Container(
                    color: Colors.grey.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.indigo.shade400,
                        strokeWidth: 5,
                      ),
                    ),
                  )
                : Container()
          ],
        ));
  }
}

/*
ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderStatusPage(
                            isFromOrder: false,
                          ),
                        ),
                      );
                    },
                    child: Text('My Order')),
                    */