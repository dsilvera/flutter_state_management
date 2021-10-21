import 'package:flutter/material.dart';

class ColorListModel {
  static List<Item> _items = [
    Item('Blue', Colors.blue),
    Item('Red', Colors.red),
    Item('Yellow', Colors.yellow),
    Item('Green', Colors.green),
    Item('Purple', Colors.purple),
    Item('Pink', Colors.pink),
    Item('Orange', Colors.orange),
  ];

  int size() {
    return _items.length;
  }

  Item getByPosition(int position) {
    return _items[position];
  }
}

class Item {
  final String name;
  final Color color;

  Item(this.name, this.color);
}
