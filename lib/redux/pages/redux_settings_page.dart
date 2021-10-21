import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_manager/models/color_list_model.dart';
import 'package:state_manager/redux/models/redux_settings_model.dart';

import '../actions.dart';

class ReduxSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Scaffold(
              appBar: AppBar(
                backgroundColor: viewModel.appState.colorSelected.color,
                title: Text("Settings"),
              ),
              body: Center(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        var item = viewModel.appState.colorListModel.getByPosition(index);
                        return _MyListItem(
                          item: item,
                          isSelected: item.color == viewModel.appState.colorSelected.color,
                          onItemSelected: (Item item) => {viewModel.onItemSelected(item)},
                        );
                      }, childCount: viewModel.appState.colorListModel.size()),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class _MyListItem extends StatelessWidget {
  final Item item;
  final bool isSelected;
  final Function(Item item) onItemSelected;

  const _MyListItem(
      {Key? key, required this.item, required this.isSelected, required this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name),
            ),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                onItemSelected(item);
              },
              child: Text(isSelected ? "selected" : "Choose"),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewModel {
  final Function(Item item) onItemSelected;
  AppState appState;

  ViewModel(this.onItemSelected, this.appState);

  factory ViewModel.create(Store<AppState> store) {
    return ViewModel((Item item) => {store.dispatch(SelectItemAction(item))}, store.state);
  }
}
