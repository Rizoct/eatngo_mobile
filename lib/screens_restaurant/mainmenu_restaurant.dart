// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/drawers/restaurantDrawer.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_booking/booking_main.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_editmenu/editmenu_category.dart';
import 'package:eatngo_thesis/screens_restaurant/screens_vieworder/vieworder_main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class MainMenuRestaurant extends StatefulWidget {
  final Map userData;
  const MainMenuRestaurant({super.key, required this.userData});

  @override
  State<MainMenuRestaurant> createState() => _MainMenuRestaurantState();
}

class _MainMenuRestaurantState extends State<MainMenuRestaurant> {
  final List<String> items = [
    'Available',
    'Full',
  ];

  @override
  void initState() {
    print(widget.userData);
    // TODO: implement initState
    super.initState();
  }

  Future setTableAvailability() async {
    var response;
    var uri = Uri.parse('$ip/API_EatNGo/edit_tableavailability.php');
    try {
      response = await http.post(uri, body: {
        'restaurantId': widget.userData['restaurantId'],
        'tableavailability': selectedValue
      });
      print(uri);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return Fluttertoast.showToast(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          msg: 'Berhasil diubah',
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: response.statusCode,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {}
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userData['name']),
      ),
      drawer: RestaurantDrawer(
        userData: widget.userData,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Table Availability',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                        setTableAvailability();
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 216, 216, 216),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
            ),
            SizedBox(
              height: 10,
            ),
            RestaurantMenuButton(
              text: 'Edit Restaurant Menu',
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EditMenuCategoryPage(
                              userData: widget.userData,
                            )));
              },
            ),
            RestaurantMenuButton(
              text: 'View Order',
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ViewOrderMainPage(
                              userData: widget.userData,
                            )));
              },
            ),
            RestaurantMenuButton(
              text: 'View Booking',
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BookingMainPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantMenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const RestaurantMenuButton(
      {super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: onpressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
