import 'package:flutter/material.dart';

class OrderStatusPage extends StatefulWidget {
  final bool isFromOrder;
  const OrderStatusPage({super.key, required this.isFromOrder});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  Future<bool> _willPopCallback() async {
    int count = 0;
    if (widget.isFromOrder) {
      Navigator.of(context).popUntil((_) => count++ >= 6);
    } else {
      Navigator.of(context).pop();
    }
    // await showDialog or Show add banners or whatever
    // then
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(title: Text('Order Status')),
      ),
    );
  }
}
