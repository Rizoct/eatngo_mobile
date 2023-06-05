int sum(List item) {
  int total = 0;
  int temp = 0;

  for (int i = 0; i < item.length; i++) {
    if (item[i]['orderQuantity'] > 1) {
      temp = item[i]['price'] * item[i]['orderQuantity'] as int;
      total = total + temp;
    } else if (item[i]['orderQuantity'] == 1) {
      total = total + item[i]['price'] as int;
    }
  }
  return total;
}
