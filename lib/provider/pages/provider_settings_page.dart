import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/models/color_list_model.dart';
import 'package:state_manager/provider/models/provider_settings_model.dart';

class ProviderSettingsPage extends StatefulWidget {
  @override
  _ProviderSettingsPageState createState() => _ProviderSettingsPageState();
}

class _ProviderSettingsPageState extends State<ProviderSettingsPage> {
  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<ColorListModel>(context, listen: false).size();
    return Consumer<ProviderSettingsModel>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: settings.colorSelected,
            title: Text("Settings"),
          ),
          body: Center(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) => _MyListItem(index),
                      childCount: itemCount),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<ColorListModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );
    var isSelected = context.select<ProviderSettingsModel, bool>(
      (settings) => settings.colorSelected == item.color,
    );

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
                var settings = context.read<ProviderSettingsModel>();
                settings.updateColorSelected(item);
              },
              child: Text(isSelected ? "selected" : "Choose"),
            ),
          ],
        ),
      ),
    );
  }
}
