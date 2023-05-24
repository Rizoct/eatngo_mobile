// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/screens_customer/tabs_restaurants/tab_info.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/tab_location.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/tab_menu.dart';
import 'package:flutter/material.dart';

class RestaurantViewCustomer extends StatefulWidget {
  const RestaurantViewCustomer({super.key});

  @override
  State<RestaurantViewCustomer> createState() => _RestaurantViewCustomerState();
}

class _RestaurantViewCustomerState extends State<RestaurantViewCustomer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('<nama resto>'),
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
        body: const TabBarView(
          children: <Widget>[
            InfoTab(),
            MenuTab(),
            LocationTab(),
          ],
        ),
      ),
    );
  }
}
