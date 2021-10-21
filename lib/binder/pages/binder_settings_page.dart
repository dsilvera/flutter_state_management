import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:state_manager/binder/models/settings_controller.dart';
import 'package:state_manager/models/color_list_model.dart';

class BinderSettingsPage extends StatefulWidget {
  @override
  _BinderSettingsPageState createState() => _BinderSettingsPageState();
}

class _BinderSettingsPageState extends State<BinderSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch(settingsRef);
    final colorList = ColorListModel();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color,
        title: Text("Settings"),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = colorList.getByPosition(index);
                return _MyListItem(item: item, isSelected: item.color == settings.color);
              }, childCount: colorList.size()),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Item item;
  final bool isSelected;

  const _MyListItem({Key? key, required this.item, required this.isSelected}) : super(key: key);

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
                if (isSelected) return;
                context.use(settingsLogicRef).updateColorSelected(item);
              },
              child: Text(isSelected ? "selected" : "Choose"),
            ),
          ],
        ),
      ),
    );
  }
}
