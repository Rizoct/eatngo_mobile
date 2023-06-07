// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MenuEditPage extends StatefulWidget {
  const MenuEditPage({super.key});

  @override
  State<MenuEditPage> createState() => _MenuEditPageState();
}

class _MenuEditPageState extends State<MenuEditPage> {
  final List<String> items = [
    'Available',
    'Sold out',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Edit Menu')),
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
        child: ListView(
          children: [
            Column(
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i0.wp.com/resepkoki.id/wp-content/uploads/2020/03/Resep-Mie-Setan.jpg?fit=1079%2C1214&ssl=1'),
                          fit: BoxFit.fill)),
                ),
                Divider(
                  height: 40,
                ),
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextFormField(
                  initialValue: 'Mie Setan',
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
                  initialValue: 'Original Spicy Noodle',
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
                  initialValue: '12000',
                  decoration: InputDecoration(hintText: 'ex: 10000'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Stock',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
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
                              fontSize: 16,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
