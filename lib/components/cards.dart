// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/screens_category/screens_menu/menu_add.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/screens_category/screens_menu/menu_edit.dart';
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
                  image: DecorationImage(
                      image: NetworkImage(imgStr), fit: BoxFit.fill),
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
                  ContentTitle(
                    title: restaurantName,
                  ),
                  Flexible(
                      child: SizedBox(
                          width: 200,
                          child: ContentSubtitle(title: restaurantAddress))),
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
        child: Stack(
          children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(imgStr), fit: BoxFit.fill)),
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
          ],
        ),
      ),
    );
  }
}

class MenuCardCheckout extends StatelessWidget {
  final String imgStr;
  final String menuName;
  final String menuDesc;
  final int menuPrice;

  const MenuCardCheckout({
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

class VoucherCard extends StatelessWidget {
  final String restoName;
  final String imgStr;
  final String menuName;
  final String menuDesc;
  final String dateEnd;

  const VoucherCard({
    super.key,
    required this.restoName,
    required this.imgStr,
    required this.menuName,
    required this.menuDesc,
    required this.dateEnd,
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
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(imgStr), fit: BoxFit.fill)),
            width: 120,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContentTitle(
                  title: '$restoName - $menuName',
                ),
                ContentSubtitle(title: menuDesc),
                SizedBox(
                  width: 10,
                ),
                ContentSubtitle(
                  title: 'Tanggal berakhir: $dateEnd',
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String restoName;
  final String imgStr;
  final double rating;
  final String date;

  const HistoryCard({
    super.key,
    required this.restoName,
    required this.imgStr,
    required this.rating,
    required this.date,
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
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(imgStr), fit: BoxFit.fill)),
            width: 120,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContentTitle(
                  title: restoName,
                ),
                RatingBar.builder(
                  itemSize: 25,
                  initialRating: rating,
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
                ContentSubtitle(
                  title: date,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class EditMenuCard extends StatelessWidget {
  final String imgStr;
  final String menuName;
  final String menuDesc;
  final int menuPrice;
  const EditMenuCard({
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imgStr), fit: BoxFit.fill),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                width: 120,
                height: MediaQuery.of(context).size.height,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContentSubtitle(
                      title: menuName,
                    ),
                    Text(
                      '$menuDesc',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Rp $menuPrice',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MenuEditPage()));
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
