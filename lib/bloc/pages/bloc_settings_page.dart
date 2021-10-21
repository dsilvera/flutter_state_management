import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/models/color_list_model.dart';

import '../models/settings_cubit.dart';

class BlocSettingsPage extends StatefulWidget {
  @override
  _BlocSettingsPageState createState() => _BlocSettingsPageState();
}

class _BlocSettingsPageState extends State<BlocSettingsPage> {
  @override
  Widget build(BuildContext context) {
    var settings = context.watch<SettingsCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.state.color,
        title: Text("Settings"),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => _MyListItem(index),
                  childCount: settings.colorListModel.size()),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorListModel = context.read<SettingsCubit>().colorListModel;
    var item = colorListModel.getByPosition(index);

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
            TextButton(onPressed: () {
              context.read<SettingsCubit>().selectColor(item);
            }, child: BlocBuilder<SettingsCubit, Item>(builder: (context, state) {
              var isSelected = state.color == item.color;
              return Text(isSelected ? "selected" : "Choose");
            })),
          ],
        ),
      ),
    );
  }
}
