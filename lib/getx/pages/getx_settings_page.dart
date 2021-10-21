import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manager/getx/models/settings_controller.dart';
import 'package:state_manager/models/color_list_model.dart';

class GetXSettingsPage extends StatefulWidget {
  @override
  _GetXSettingsPageState createState() => _GetXSettingsPageState();
}

class _GetXSettingsPageState extends State<GetXSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find();
    final colorList = ColorListModel();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GetBuilder<SettingsController>(
              builder: (_) => AppBar(
                    backgroundColor: controller.colorSelected,
                    title: Text("Settings"),
                  ))),
      body: Center(
        child: CustomScrollView(
          slivers: [
            GetBuilder<SettingsController>(
                builder: (_) => SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        var item = colorList.getByPosition(index);
                        return _MyListItem(
                            item: item, isSelected: item.color == controller.colorSelected);
                      }, childCount: colorList.size()),
                    )),
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
    final SettingsController controller = Get.find();
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
                controller.updateColorSelected(item);
              },
              child: Text(isSelected ? "selected" : "Choose"),
            ),
          ],
        ),
      ),
    );
  }
}
