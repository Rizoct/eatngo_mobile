// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

class BookTablePage extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<dynamic, dynamic> userData;
  const BookTablePage({super.key, required this.data, required this.userData});

  @override
  State<BookTablePage> createState() => _BookTablePageState();
}

class _BookTablePageState extends State<BookTablePage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  String url_whatsapp = "";
  String phoneNumber = "";
  String trimmedNumber = "";
  String time = '';
  String dateTime = '';
  Map<dynamic, dynamic> bookingData = {
    'bookingId': '',
    'customerId': '',
    'restaurantId': '',
    'bookingDate': '',
    'numberOfPerson': '',
    'status': ''
  };
  String kodeBooking = '';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);
        _selectTime(context);
      });
    }
  }

  void _launchWhatsApp(String url_whatsapp) async {
    if (await canLaunchUrl(Uri.parse(url_whatsapp))) {
      await launchUrl(Uri.parse(url_whatsapp));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  Future viewBooking() async {
    var response;
    var url = Uri.parse('$ip/API_EatNGo/view_booking.php');
    try {
      response = await http.post(url);
      if (response.statusCode == 200) {
        setState(() {
          bookingData = json.decode(response.body);
        });
        print(bookingData);
        Future.delayed(Duration(milliseconds: 1200), () {
          setState(() {
            kodeBooking = bookingData['bookingId'];
          });
        });
      } else {
        return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'Something went wrong',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: '$e',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  Future addBooking() async {
    var response;
    var url = Uri.parse('$ip/API_EatNGo/add_booking.php');
    try {
      response = await http.post(url, body: {
        'customerId': widget.userData['customerId'],
        'restaurantId': widget.data['restaurantId'],
        'bookingDate': dateController.text,
        'numberOfPerson': numberController.text,
      });
      if (response.statusCode == 200) {
        viewBooking();

        setState(() {
          kodeBooking = bookingData['bookingId'];
        });

        return Fluttertoast.showToast(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          msg: 'Berhasil menambah booking',
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
      return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: '$e',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  Future _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      print(picked);
      final dateTime = selectedDate.applied(picked);
      print(dateTime);
      dateController.text = dateTime.toString();
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    phoneNumber = widget.data['contact_number'];
    trimmedNumber = phoneNumber.substring(1);
    url_whatsapp = "whatsapp://send?phone=+62$trimmedNumber&text=hello";

    super.initState();
    nameController.text = widget.userData['name'];
    emailController.text = widget.userData['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Table Reservation'),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.indigo.shade700,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
          ),
          Center(
            child: Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: TitleMain(title: 'Book a Table')),
                      TextFormNormalAutoFilled(controller: nameController),
                      TextFormNormalAutoFilled(controller: emailController),
                      Material(
                        elevation: 10.0,
                        shadowColor: Colors.black,
                        child: TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              hintText: 'Pilih waktu booking',
                              contentPadding:
                                  EdgeInsets.only(left: 20, top: 15),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  icon: const Icon(Icons.date_range))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          elevation: 10.0,
                          shadowColor: Colors.black,
                          child: TextFormField(
                            controller: numberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Jumlah Orang',
                              contentPadding: EdgeInsets.only(left: 20, top: 0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Konfirmasi Booking'),
                                    content: Text(
                                        'Apakah anda yakin ingin melakukan booking?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            addBooking();

                                            dialogWhatsapp(context);
                                          },
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    ],
                                  );
                                });
                          },
                          child: Text('Book Now'),
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  Future<dynamic> dialogWhatsapp(BuildContext context) {
    setState(() {});
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lakukan konfirmasi dengan restoran'),
            content: Container(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                RichTextBoldTail(nonBold: 'Kode Booking: ', bold: kodeBooking),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _launchWhatsApp(url_whatsapp);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage('assets/images/whatsapp_logo.png'),
                        ),
                        Text(' Hubungi via Whatsapp')
                      ],
                    ),
                  ),
                )
              ]),
            ),
          );
        });
  }
}

class TextFormNormalAutoFilled extends StatelessWidget {
  const TextFormNormalAutoFilled({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          controller: controller,
          onChanged: (value) {},
          autofocus: false,
          enabled: false,
          decoration: InputDecoration(
              hintText: 'tes',
              fillColor: Colors.grey.shade200,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.white, width: 3.0))),
        ),
      ),
    );
  }
}
