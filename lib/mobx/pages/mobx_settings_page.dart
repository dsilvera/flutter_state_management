import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:state_manager/mobx/models/settings_store.dart';
import 'package:state_manager/models/color_list_model.dart';

class MobXSettingsPage extends StatefulWidget {
  @override
  _MobXSettingsPageState createState() => _MobXSettingsPageState();
}

class _MobXSettingsPageState extends State<MobXSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = GetIt.I.get<SettingsStore>();
    final colorList = ColorListModel();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Observer(
              builder: (_) => AppBar(
                    backgroundColor: settings.colorSelected.color,
                    title: Text("Settings"),
                  ))),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = colorList.getByPosition(index);
                return _MyListItem(item: item);
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

  const _MyListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = GetIt.I.get<SettingsStore>();
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
            Observer(
                builder: (_) => TextButton(
                      onPressed: () {
                        if (item.color == settings.colorSelected.color) return;
                        settings.updateColorSelected(item);
                      },
                      child: Text(item.color == settings.colorSelected.color ? "selected" : "Choose"),
                    )),
          ],
        ),
      ),
    );
  }
}
