import 'package:eatngo_thesis/components/buttons.dart';
import 'package:eatngo_thesis/components/cards.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _elements = [
  {'name': 'Tempe', 'group': 'Makanan'},
  {'name': 'Tahu', 'group': 'Makanan'},
  {'name': 'Es Teh', 'group': 'Minuman'},
  {'name': 'Es Jeruk', 'group': 'Minuman'},
  {'name': 'Ayam', 'group': 'Makanan'},
  {'name': 'Soda Gembira', 'group': 'Minuman'},
  {'name': 'French Fries', 'group': 'Snack'},
  {'name': 'Hotdog', 'group': 'Snack'},
];

class OrderDineInPage extends StatefulWidget {
  const OrderDineInPage({super.key});

  @override
  State<OrderDineInPage> createState() => _OrderDineInPageState();
}

class _OrderDineInPageState extends State<OrderDineInPage> {
  bool isOrder = false;
  void initState() {
    super.initState();

    isOrder = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grouped List View Example'),
      ),
      bottomNavigationBar: isOrder
          ? BottomAppBar(
              color: Colors.grey[50],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: OrderButton(
                  ButtonText: 'Order',
                  onPressed: () {
                    print('pressed');
                  },
                ),
              ))
          : null,
      body: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: false,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
              elevation: 8.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: MenuCardwithAdd(
                  menuName: element['name'],
                  menuDesc: 'Tes Desc',
                  imgStr: '',
                  menuPrice: 10000,
                  onPressed: () {
                    setState(() {
                      isOrder = true;
                    });
                  }));
        },
      ),
    );
  }
}
