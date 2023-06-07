// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MenuAddPage extends StatefulWidget {
  const MenuAddPage({super.key});

  @override
  State<MenuAddPage> createState() => _MenuAddPageState();
}

class _MenuAddPageState extends State<MenuAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Add Menu')),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.indigo,
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: Center(
                  child: Text(
                    'Current Category = Makanan',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
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
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'ex: Nasi Goreng'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextFormField(
              decoration:
                  InputDecoration(hintText: 'ex: Nasi Goreng tradisional'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Price',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'ex: 10000'),
            )
          ],
        ),
      ),
    );
  }
}
