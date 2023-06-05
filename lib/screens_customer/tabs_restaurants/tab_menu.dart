// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/screens_customer/restaurantview_customer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'dart:math';

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
  }

  int _currentIndex = 0;
  final List<Widget> imageSliders = menuListWithTitle
      .map((item) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                        menuListWithTitle[menuListWithTitle.indexOf(item)]
                            ['img'],
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
                          menuListWithTitle[menuListWithTitle.indexOf(item)]
                              ['title'],
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
            items: imageSliders,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ContentTitle(
              title: 'Menu',
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: menuListWithTitle.length,
          itemBuilder: (context, index) {
            return MenuCard(
              imgStr: menuListWithTitle[index]['img'],
              menuDesc: menuListWithTitle[index]['desc'],
              menuName: menuListWithTitle[index]['title'],
              menuPrice: menuListWithTitle[index]['price'],
            );
          },
        ),
      ],
    ));
  }
}
