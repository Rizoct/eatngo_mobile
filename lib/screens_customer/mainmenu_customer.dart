// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/drawers/maindrawer.dart';
import 'package:eatngo_thesis/screens_customer/restaurantview_customer.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/screens_checkout/checkout_orderstatus.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'dart:math';

class MainMenuCustomer extends StatefulWidget {
  final Map data;
  const MainMenuCustomer({super.key, required this.data});

  @override
  State<MainMenuCustomer> createState() => _MainMenuCustomerState();
}

class _MainMenuCustomerState extends State<MainMenuCustomer> {
  getUserData() {}

  final List<Widget> imageSliders = imgListWithTitle
      .map((item) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item['img'],
                        fit: BoxFit.cover, width: 1000.0),
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
                          '${item['title']}',
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
      .toList();

  String searchText = "";

  @override
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
              });
            },
          ),
        ),
        drawer: MainDrawer(data: widget.data),
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
                ),
                items: imageSliders,
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
              itemCount: imgListWithTitle.length,
              itemBuilder: (context, index) {
                return RestaurantMainCard(
                  imgStr: imgListWithTitle[index]['img'],
                  restaurantName: imgListWithTitle[index]['title'],
                  restaurantAddress: imgListWithTitle[index]['address'],
                  restaurantRating: imgListWithTitle[index]['rating'],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantViewCustomer(
                          imgStr: imgListWithTitle[index]['img'],
                          restaurantName: imgListWithTitle[index]['title'],
                          restaurantAddress: imgListWithTitle[index]['address'],
                          restaurantRating: imgListWithTitle[index]['rating'],
                          restaurantDesc: imgListWithTitle[index]['desc'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
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