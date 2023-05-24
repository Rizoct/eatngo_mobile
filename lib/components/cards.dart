// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'texts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantMainCard extends StatelessWidget {
  final String imgStr;
  final String restaurantName;
  final String restaurantAddress;
  final double restaurantRating;
  final VoidCallback onPressed;
  const RestaurantMainCard(
      {super.key,
      required this.imgStr,
      required this.restaurantName,
      required this.restaurantAddress,
      required this.restaurantRating,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey, width: 0.5)),
          width: double.infinity,
          height: 120,
          child: Row(children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0)),
              width: 120,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentSubtitle(
                    title: restaurantName,
                  ),
                  ContentSubtitle(title: restaurantAddress),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: restaurantRating,
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
                        width: 10,
                      ),
                      ContentSubtitle(
                        title: restaurantRating.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String imgStr;
  final String menuName;
  final String menuDesc;
  final int menuPrice;
  const MenuCard({
    super.key,
    required this.imgStr,
    required this.menuName,
    required this.menuDesc,
    required this.menuPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 0.5)),
        width: double.infinity,
        height: 120,
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10.0)),
            width: 120,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContentSubtitle(
                  title: '$menuName',
                ),
                ContentSubtitle(title: menuDesc),
                SizedBox(
                  width: 10,
                ),
                ContentSubtitle(
                  title: 'Rp. $menuPrice',
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
