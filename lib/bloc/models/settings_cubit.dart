import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/models/color_list_model.dart';

class SettingsCubit extends Cubit<Item> {
  ColorListModel colorListModel;

  SettingsCubit(this.colorListModel) : super(Item("blue", Colors.blue));

  void selectColor(Item item) {
    emit(item);
  }
}
