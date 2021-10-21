import 'package:flutter/material.dart';

import '../../models/color_list_model.dart';

class AppState {
  ColorListModel colorListModel;
  Item colorSelected;

  AppState({required this.colorListModel, required this.colorSelected});

  factory AppState.initial() =>
      AppState(colorListModel: ColorListModel(), colorSelected: Item("blue", Colors.blue));

  void updateColorSelected(Item color) {
    colorSelected = color;
  }
}
