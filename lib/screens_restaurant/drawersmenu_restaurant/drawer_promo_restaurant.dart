import 'package:eatngo_thesis/components/cards.dart';
import 'package:eatngo_thesis/dummy_data/static_data.dart';
import 'package:eatngo_thesis/screens_restaurant/drawersmenu_restaurant/screens_promo/promo_addpromo.dart';
import 'package:flutter/material.dart';

class DrawerViewPromoPage extends StatefulWidget {
  const DrawerViewPromoPage({super.key});

  @override
  State<DrawerViewPromoPage> createState() => _DrawerViewPromoPageState();
}

class _DrawerViewPromoPageState extends State<DrawerViewPromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Promo & Discount')),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 2.0))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PromoAddPage()));
              },
              child: Text('Add Promo'),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: voucherList.length,
        itemBuilder: (context, index) {
          return VoucherCardRestaurant(
            imgStr: voucherList[index]['img'],
            promoDesc: voucherList[index]['desc'],
            promoName: voucherList[index]['title'],
            dateEnd: voucherList[index]['date-end'],
          );
        },
      ),
    );
  }
}
