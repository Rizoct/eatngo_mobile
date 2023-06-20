// ignore_for_file: prefer_const_constructors

import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:flutter/material.dart';

class BookingMainPage extends StatefulWidget {
  const BookingMainPage({super.key});

  @override
  State<BookingMainPage> createState() => _BookingMainPageState();
}

class _BookingMainPageState extends State<BookingMainPage> {
  final List data = [
    {
      'custName': 'Yutaro Tanaka',
      'bookingID': 'BK001',
      'peopleCount': 5,
      'bookDate': '01-01-2024, 08:00:00',
      'orderStatus': 'Accepted',
    },
    {
      'custName': 'Christiano Ekasakti',
      'bookingID': 'BK002',
      'peopleCount': 10,
      'bookDate': '01-01-2024, 08:00:00',
      'orderStatus': 'Pending',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedSearchBar(
          searchDecoration: InputDecoration(
            hintText: "Search BookingID",
            alignLabelWithHint: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          searchStyle: TextStyle(color: Colors.white),
          label: "Search Booking Here",
          labelStyle: TextStyle(fontSize: 17),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(2, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data[index]['custName'] +
                                  ' / ' +
                                  data[index]['bookingID'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(
                              children: [
                                (data[index]['orderStatus'] != 'Accepted')
                                    ? IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Konfirmasi Booking ${data[index]['bookingID']}'),
                                                  content: Text(
                                                      'Apakah anda ingin menerima booking dari ${data[index]['custName']}?'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {},
                                                        child: Text('Cancel')),
                                                    TextButton(
                                                        onPressed: () {},
                                                        child: Text('Confirm'))
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 30,
                                        ))
                                    : Container(),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Konfirmasi Booking ${data[index]['bookingID']}'),
                                              content: Text(
                                                  'Apakah anda ingin menolak booking dari ${data[index]['custName']}?'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text('Cancel')),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text('Confirm'))
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichTextBoldTail(
                                bold: '${data[index]['peopleCount']} Orang',
                                nonBold: 'Jumlah Orang : ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichTextBoldTail(
                                bold: '${data[index]['bookDate']}',
                                nonBold: 'Tanggal : ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20)),
                            color: Colors.indigo,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(2, 2), // changes position of shadow
                              ),
                            ],
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.report,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RichTextBoldTailWhite(
                                  nonBold: 'Booking Status : ',
                                  bold: data[index]['orderStatus'])
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            );
          }),
    );
  }
}
