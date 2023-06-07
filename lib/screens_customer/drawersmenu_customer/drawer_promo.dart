import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:flutter/material.dart';

class DrawerPromoPage extends StatefulWidget {
  const DrawerPromoPage({super.key});

  @override
  State<DrawerPromoPage> createState() => _DrawerPromoPageState();
}

class _DrawerPromoPageState extends State<DrawerPromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Promo & Discount')),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: voucherList.length,
        itemBuilder: (context, index) {
          return VoucherCard(
            restoName: voucherList[index]['resto'],
            imgStr: voucherList[index]['img'],
            menuDesc: voucherList[index]['desc'],
            menuName: voucherList[index]['title'],
            dateEnd: voucherList[index]['date-end'],
          );
        },
      ),
    );
  }
}
