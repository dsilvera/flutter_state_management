import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../models/color_list_model.dart';

part 'settings_store.g.dart';


class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  @observable
  Item colorSelected = Item("blue", Colors.blue);

  @action
  void updateColorSelected(Item color) => colorSelected = color;
}
