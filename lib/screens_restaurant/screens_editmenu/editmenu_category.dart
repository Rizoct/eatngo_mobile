// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/screens_category/category_add.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/screens_category/category_edit.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/screens_category/screens_menu/menucategory_screens.dart';
import 'package:flutter/material.dart';

class EditMenuCategoryPage extends StatefulWidget {
  const EditMenuCategoryPage({super.key});

  @override
  State<EditMenuCategoryPage> createState() => _EditMenuCategoryPageState();
}

class _EditMenuCategoryPageState extends State<EditMenuCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu category'),
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
                      builder: (BuildContext context) => CategoryAddPage()));
            },
            child: Text('Add Category'),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            data: categoryMenu,
            index: index,
            onpressed: () {},
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final List data;
  final int index;
  final VoidCallback onpressed;
  const CategoryCard(
      {super.key,
      required this.data,
      required this.index,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MenuCategoryPage()));
        },
        child: Container(
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1.5, color: Colors.black)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      child: Text(data[index]['count'].toString()),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      data[index]['title'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoryEditPage()));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoryEditPage()));
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
