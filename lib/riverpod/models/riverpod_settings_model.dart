import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/color_list_model.dart';

class RiverpodSettingsModel extends ChangeNotifier {
  Item? _colorSelected;

  Color get colorSelected => _colorSelected?.color ?? Colors.blue;
  String get colorSelectedName=> _colorSelected?.name ?? "blue";

  void updateColorSelected(Item color) {
    _colorSelected = color;
    notifyListeners();
  }
}
