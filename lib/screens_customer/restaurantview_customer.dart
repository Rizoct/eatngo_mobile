// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/screens_customer/tabs_restaurants/tab_info.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/tab_location.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/tab_menu.dart';
import 'package:flutter/material.dart';

class RestaurantViewCustomer extends StatefulWidget {
  final String imgStr;
  final String restaurantName;
  final String restaurantAddress;
  final double restaurantRating;
  final String restaurantDesc;
  const RestaurantViewCustomer(
      {super.key,
      required this.imgStr,
      required this.restaurantAddress,
      required this.restaurantName,
      required this.restaurantRating,
      required this.restaurantDesc});

  @override
  State<RestaurantViewCustomer> createState() => _RestaurantViewCustomerState();
}

class _RestaurantViewCustomerState extends State<RestaurantViewCustomer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.restaurantName),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.info),
                text: 'Info',
              ),
              Tab(
                icon: Icon(Icons.menu_book),
                text: 'Menu',
              ),
              Tab(
                icon: Icon(Icons.location_on),
                text: 'Location',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            InfoTab(
              imgStr: widget.imgStr,
              restaurantName: widget.restaurantName,
              restaurantAddress: widget.restaurantAddress,
              restaurantRating: widget.restaurantRating,
              restaurantDesc: widget.restaurantDesc,
            ),
            MenuTab(),
            LocationTab(
              restoName: widget.restaurantName,
            ),
          ],
        ),
      ),
    );
  }
}
