import 'package:eatngo_thesis/components/buttons.dart';
import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/components/texts.dart';
import 'package:eatngo_thesis/screens_customer/tabs_restaurants/screens_order/screens_checkout/checkout_dinein.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class OrderDineInPage extends StatefulWidget {
  const OrderDineInPage({super.key});

  @override
  State<OrderDineInPage> createState() => _OrderDineInPageState();
}

class _OrderDineInPageState extends State<OrderDineInPage> {
  final List _elements = [
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

  List orderList = [];
  bool isOrder = false;
  int counter = 0;
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
      bottomNavigationBar: (counter > 0)
          ? BottomAppBar(
              color: Colors.grey[50],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: OrderButton(
                  ButtonText: 'Order',
                  onPressed: () {
                    if (orderList.isNotEmpty) {
                      orderList.clear();
                    }
                    for (int a = 0; a < _elements.length; a++) {
                      if (_elements[a]['orderQuantity'] != 0) {
                        orderList.add(_elements[a]);
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutDineInPage(
                          checkOutData: orderList,
                        ),
                      ),
                    );
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
                  orderQuantity: element['orderQuantity'],
                  onPressedAdd: () {
                    setState(() {
                      isOrder = true;
                      element['orderQuantity']++;
                      counter++;
                    });
                  },
                  onPressedReduce: () {
                    setState(() {
                      if (element['orderQuantity'] == 0) {
                        element['isZero'] = true;
                      } else {
                        element['orderQuantity']--;
                        counter--;
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
  final int orderQuantity;
  const MenuCardwithAdd({
    super.key,
    required this.imgStr,
    required this.menuName,
    required this.menuDesc,
    required this.menuPrice,
    required this.onPressedAdd,
    required this.onPressedReduce,
    required this.orderQuantity,
  });

  @override
  Widget build(BuildContext context) {
    int count = orderQuantity;
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
              (count != 0)
                  ? IconButton(
                      onPressed: onPressedReduce, icon: Icon(Icons.remove))
                  : Container(),
              Text(
                orderQuantity.toString(),
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
