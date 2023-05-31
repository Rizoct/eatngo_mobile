import 'dart:ffi';

import 'package:flutter/material.dart';

int sum(List item) {
  int total = item[0]['price'] as int;
  int temp = 0;

  for (int i = 1; i < item.length; i++) {
    if (item[i]['orderQuantity'] > 1) {
      temp = item[i]['price'] * item[i]['orderQuantity'] as int;
      total = total + temp;
    } else {
      total = total + item[i]['price'] as int;
    }
  }

  return total;
}
