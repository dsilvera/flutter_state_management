import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/color_list_model.dart';

class SettingsController extends GetxController {
  Item? _colorSelected;

  Color get colorSelected => _colorSelected?.color ?? Colors.blue;

  String get colorSelectedName => _colorSelected?.name ?? "blue";

  void updateColorSelected(Item color) {
    _colorSelected = color;
    update();
  }
}
