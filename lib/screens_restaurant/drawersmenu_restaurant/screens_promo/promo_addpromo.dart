// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PromoAddPage extends StatefulWidget {
  const PromoAddPage({super.key});

  @override
  State<PromoAddPage> createState() => _PromoAddPageState();
}

class _PromoAddPageState extends State<PromoAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Add Promo')),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {},
              child: Text('Save'),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Photo',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add_a_photo), Text('Add a photo')],
                    ),
                  ),
                  Divider(
                    height: 40,
                  ),
                  Text(
                    'Promo Title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: 'ex: Buy 1 Get 1 Free'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText:
                            'ex: Beli mie apa saja dapatkan 1 free makanan lain!!'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Valid From',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'ex: 01-01-2001',
                        suffixIcon: Icon(Icons.calendar_month)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Valid Until',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'ex: 01-01-2001',
                        suffixIcon: Icon(Icons.calendar_month)),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
