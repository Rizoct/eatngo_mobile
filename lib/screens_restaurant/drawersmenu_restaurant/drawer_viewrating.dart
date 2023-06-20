// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DrawerViewRatingPage extends StatefulWidget {
  const DrawerViewRatingPage({super.key});

  @override
  State<DrawerViewRatingPage> createState() => _DrawerViewRatingPageState();
}

class _DrawerViewRatingPageState extends State<DrawerViewRatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Rating'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Center(
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i0.wp.com/kliklegal.com/wp-content/uploads/2022/08/Mie-Gacoan-Tak-Bisa-Kantongi-Label-Halal-Benarkah.jpg'),
                      fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Mie Gacoan',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '4.5',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              RatingBar.builder(
                itemSize: 25,
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 5,
              ),
              Text('100k reviews')
            ]),
          )
        ]),
      ),
    );
  }
}
