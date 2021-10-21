import 'package:redux/redux.dart';
import 'package:state_manager/models/color_list_model.dart';
import 'package:state_manager/redux/models/redux_settings_model.dart';

import 'actions.dart';

AppState appReducer(AppState state, action){
  return AppState(
      colorListModel: ColorListModel(),
      colorSelected: colorSelectedReducer(state.colorSelected, action));
}

final Reducer<Item> colorSelectedReducer = TypedReducer<Item, SelectItemAction>(_selectedItem);

Item _selectedItem(Item oldItem, SelectItemAction action) => action.item;
