import 'package:binder/binder.dart';
import 'package:flutter/material.dart';

import '../../models/color_list_model.dart';

final settingsRef = StateRef<Item>(Item("blue", Colors.blue));

final settingsLogicRef = LogicRef((scope) => SettingsLogic(scope));

class SettingsLogic with Logic {
  SettingsLogic(this.scope);

  @override
  final Scope scope;

  void updateColorSelected(Item color) => write(settingsRef, color);
}
