// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/screens_restaurant/screens_vieworder/tabs_vieworder/tab_ordercancelled.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_vieworder/tabs_vieworder/tab_orderdone.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_vieworder/tabs_vieworder/tab_orderlist.dart';
import 'package:flutter/material.dart';

class ViewOrderMainPage extends StatefulWidget {
  final Map userData;
  const ViewOrderMainPage({super.key, required this.userData});

  @override
  State<ViewOrderMainPage> createState() => _ViewOrderMainPageState();
}

class _ViewOrderMainPageState extends State<ViewOrderMainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Order List',
              ),
              Tab(
                text: 'Done',
              ),
              Tab(
                text: 'Cancelled',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TabOrderList(userData: widget.userData),
            TabOrderDone(),
            TabOrderCancelled()
          ],
        ),
      ),
    );
  }
}
