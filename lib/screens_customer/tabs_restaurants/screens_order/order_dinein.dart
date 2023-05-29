import 'package:eatngo_thesis/components/buttons.dart';
import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _elements = [
  {
    'name': 'Tempe',
    'group': 'Makanan',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
  {
    'name': 'Tahu',
    'group': 'Makanan',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
  {
    'name': 'Es Teh',
    'group': 'Minuman',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
  {
    'name': 'Es Jeruk',
    'group': 'Minuman',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
  {
    'name': 'Ayam',
    'group': 'Makanan',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
  {
    'name': 'Soda Gembira',
    'group': 'Minuman',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
  {
    'name': 'French Fries',
    'group': 'Snack',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
  {
    'name': 'Hotdog',
    'group': 'Snack',
    'desc': 'Bukan Tahu',
    'orderQuantity': 0,
    'price': 2000,
    'isZero': true,
  },
];

class OrderDineInPage extends StatefulWidget {
  const OrderDineInPage({super.key});

  @override
  State<OrderDineInPage> createState() => _OrderDineInPageState();
}

class _OrderDineInPageState extends State<OrderDineInPage> {
  bool isOrder = false;
  int a = 0;
  void initState() {
    super.initState();

    isOrder = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Menu'),
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
                  menuDesc: element['desc'],
                  imgStr: '',
                  menuPrice: element['price'],
                  orderCount: element['orderQuantity'],
                  isZero: element['isZero'],
                  onPressedAdd: () {
                    setState(() {
                      isOrder = true;
                      element['orderQuantity']++;
                    });
                  },
                  onPressedReduce: () {
                    setState(() {
                      if (element['orderQuantity'] == 0) {
                        element['isZero'] = true;
                      } else {
                        element['orderQuantity']--;
                      }
                    });
                  }));
        },
      ),
    );
  }
}

class MenuCardwithAdd extends StatelessWidget {
  final String imgStr;
  final String menuName;
  final String menuDesc;
  final int menuPrice;
  final VoidCallback onPressedAdd;
  final VoidCallback onPressedReduce;
  final int orderCount;
  final bool isZero;
  const MenuCardwithAdd(
      {super.key,
      required this.imgStr,
      required this.menuName,
      required this.menuDesc,
      required this.menuPrice,
      required this.onPressedAdd,
      required this.onPressedReduce,
      required this.orderCount,
      required this.isZero});

  @override
  Widget build(BuildContext context) {
    bool isZero = true;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 0.5)),
        width: double.infinity,
        height: 120,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0)),
                width: 120,
                height: MediaQuery.of(context).size.height,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContentSubtitle(
                      title: menuName,
                    ),
                    ContentSubtitle(title: menuDesc),
                    SizedBox(
                      width: 10,
                    ),
                    ContentSubtitle(
                      title: 'Rp. $menuPrice',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: onPressedReduce, icon: Icon(Icons.remove)),
              Text(
                orderCount.toString(),
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              IconButton(onPressed: onPressedAdd, icon: Icon(Icons.add)),
            ],
          ),
        ]),
      ),
    );
  }
}
