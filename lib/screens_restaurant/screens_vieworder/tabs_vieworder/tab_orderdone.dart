import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';

class TabOrderDone extends StatefulWidget {
  const TabOrderDone({super.key});

  @override
  State<TabOrderDone> createState() => _TabOrderDoneState();
}

class _TabOrderDoneState extends State<TabOrderDone> {
  final List data = [
    {
      'custName': 'Rizky Octavian Dwipratama',
      'transactionId': 'TR001',
      'dateOrder': '01-01-2023',
      'totalCost': 'Rp 36.000',
    },
    {
      'custName': 'Yutaro Tanaka',
      'transactionId': 'TR002',
      'dateOrder': '01-01-2023',
      'totalCost': 'Rp 42.000',
    },
    {
      'custName': 'Christiano Ekasakti Sangalang',
      'transactionId': 'TR003',
      'dateOrder': '01-01-2023',
      'totalCost': 'Rp 50.000',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AnimatedSearchBar(
          searchDecoration: InputDecoration(
            hintText: "Search",
            alignLabelWithHint: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          searchStyle: TextStyle(color: Colors.white),
          label: "Search Order Here",
          labelStyle: TextStyle(fontSize: 17),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0.5,
                    blurRadius: 4,
                    offset: Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Text(data[index]['custName']),
                subtitle: Text(data[index]['transactionId'] +
                    ' / ' +
                    data[index]['dateOrder']),
                trailing: Text(data[index]['totalCost']),
              ),
            ),
          );
        },
      ),
    );
  }
}
