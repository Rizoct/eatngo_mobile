// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eatngo_thesis/components/buttons.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/order_main.dart';
import 'package:flutter/material.dart';

class InfoTab extends StatefulWidget {
  final String imgStr;
  final String restaurantName;
  final String restaurantAddress;
  final String restaurantDesc;
  final double restaurantRating;
  const InfoTab(
      {super.key,
      required this.imgStr,
      required this.restaurantAddress,
      required this.restaurantName,
      required this.restaurantRating,
      required this.restaurantDesc});

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: OrderButton(
                ButtonText: 'Order',
                onPressed: () {
                  print('pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderMainPage(
                        restoName: widget.restaurantName,
                      ),
                    ),
                  );
                },
              ),
            )),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imgStr), fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: ContentTitle(title: widget.restaurantName),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: SizedBox(
                width: 150,
                child: Text(
                  widget.restaurantDesc,
                  style: TextStyle(height: 1.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: SizedBox(
                width: 150,
                child: Text(
                  widget.restaurantAddress,
                  style: TextStyle(height: 1.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: SizedBox(
                width: 150,
                child: Text(
                  "Table(s) : Still Available",
                  style: TextStyle(height: 1.5),
                ),
              ),
            ),
          ],
        ));
  }
}
