// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eatngo_thesis/components/texts.dart';
import 'package:flutter/material.dart';

class BookTablePage extends StatefulWidget {
  const BookTablePage({super.key});

  @override
  State<BookTablePage> createState() => _BookTablePageState();
}

class _BookTablePageState extends State<BookTablePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = 'Rizky Octavian Dwipratama';
    emailController.text = 'rizky.dwipratama@binus.ac.id';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      TextFormNormal(hint: 'Date & Time'),
                      TextFormNormal(hint: 'Number of Person'),
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
                                          onPressed: () {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Lakukan konfirmasi dengan restoran'),
                                                    content: Container(
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            RichTextBoldTail(
                                                                nonBold:
                                                                    'Kode Booking: ',
                                                                bold: 'BK001'),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CircleAvatar(
                                                                      radius:
                                                                          15,
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                              'assets/images/whatsapp_logo.png'),
                                                                    ),
                                                                    Text(
                                                                        ' Hubungi via Whatsapp')
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ]),
                                                    ),
                                                  );
                                                });
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

class TextFormNormal extends StatelessWidget {
  const TextFormNormal({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          onChanged: (value) {},
          autofocus: false,
          enabled: false,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
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
