import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DrawerHistoryPage extends StatefulWidget {
  const DrawerHistoryPage({super.key});

  @override
  State<DrawerHistoryPage> createState() => _DrawerHistoryPageState();
}

class _DrawerHistoryPageState extends State<DrawerHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      actions: [
                        TextButton(onPressed: () {}, child: Text('Cancel')),
                        TextButton(onPressed: () {}, child: Text('Save'))
                      ],
                      title: Text(historyList[index]['resto']),
                      content: Container(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Beri penilaian terhadap restoran'),
                          SizedBox(height: 20),
                          RatingBar.builder(
                            itemSize: 25,
                            initialRating: 1.0,
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
                          )
                        ],
                      )),
                    );
                  });
            },
            child: HistoryCard(
              restoName: historyList[index]['resto'],
              imgStr: historyList[index]['img'],
              rating: historyList[index]['rating'],
              date: historyList[index]['date'],
            ),
          );
        },
      ),
    );
  }
}
