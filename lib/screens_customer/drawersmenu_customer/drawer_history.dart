import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class DrawerHistoryPage extends StatefulWidget {
  final Map userData;
  const DrawerHistoryPage({super.key, required this.userData});

  @override
  State<DrawerHistoryPage> createState() => _DrawerHistoryPageState();
}

class _DrawerHistoryPageState extends State<DrawerHistoryPage> {
  List historyData = [];
  double tempRating = 0;
  @override
  void initState() {
    getHistory();
    print(widget.userData);
    super.initState();
  }

  Future updateHistory(String historyId, double rating, int index) async {
    var response;
    var url = Uri.http(ip, '/API_EatNGo/edit_rating.php', {'q': '{http}'});
    try {
      response = await http.post(url, body: {
        'historyId': historyData[index]['historyId'],
        'rating': tempRating.toString()
      });

      if (response.statusCode == 200) {
        getHistory();
        return Fluttertoast.showToast(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          msg: 'Success',
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Something went wrong',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future getHistory() async {
    var response;
    var url = Uri.http(ip, '/API_EatNGo/view_history.php', {'q': '{http}'});
    try {
      response = await http.post(url, body: {
        'customerId': widget.userData['customerId'],
      });
      if (response.statusCode == 200) {
        setState(() {
          historyData = json.decode(response.body);
        });
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Something went wrong',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: historyData.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      tempRating = 0;
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      print('tes');
                                      updateHistory(
                                          historyData[index]['historyId'],
                                          tempRating,
                                          index);
                                      tempRating = 5;
                                      Navigator.pop(context);
                                    },
                                    child: Text('Save'))
                              ],
                              title: Text(historyData[index]['name']),
                              content: Container(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Beri penilaian terhadap restoran'),
                                  SizedBox(height: 20),
                                  RatingBar.builder(
                                    itemSize: 25,
                                    initialRating: double.parse(
                                        historyData[index]['cust_rating']),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        tempRating = rating;
                                        print(tempRating);
                                      });
                                    },
                                  )
                                ],
                              )),
                            );
                          });
                    },
                    child: HistoryCard(
                      restoName: historyData[index]['name'],
                      imgStr: historyData[index]['photo_url'],
                      rating: double.parse(historyData[index]['cust_rating']),
                      date: historyData[index]['order_date'],
                    ),
                  );
                },
              )
            : Center(
                child: Text('No Data'),
              ));
  }
}
