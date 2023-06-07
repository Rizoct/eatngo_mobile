import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:flutter/material.dart';

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
          return HistoryCard(
            restoName: historyList[index]['resto'],
            imgStr: historyList[index]['img'],
            rating: historyList[index]['rating'],
            date: historyList[index]['date'],
          );
        },
      ),
    );
  }
}
