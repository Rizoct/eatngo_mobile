// ignore_for_file: prefer_const_constructors

import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/screens_category/screens_menu/menu_add.dart';
import 'package:flutter/material.dart';

class MenuCategoryPage extends StatefulWidget {
  const MenuCategoryPage({super.key});

  @override
  State<MenuCategoryPage> createState() => _MenuCategoryPageState();
}

class _MenuCategoryPageState extends State<MenuCategoryPage> {
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
        itemCount: menuListWithTitle.length,
        itemBuilder: (context, index) {
          return EditMenuCard(
            imgStr: menuListWithTitle[index]['img'],
            menuDesc: menuListWithTitle[index]['desc'],
            menuName: menuListWithTitle[index]['title'],
            menuPrice: menuListWithTitle[index]['price'],
          );
        },
      ),
    );
  }
}
