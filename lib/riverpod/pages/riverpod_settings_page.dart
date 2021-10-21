import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class RiverpodSettingsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final settings = watch(settingsProvider);
    final colorList = context.read(colorListProvider);
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
                      childCount: colorList.size()),
                ),
              ],
            ),
          ),
    );
  }
}

class _MyListItem extends ConsumerWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {

    final colorList = context.read(colorListProvider);
    final settings = watch(settingsProvider);
    var item = colorList.getByPosition(index);
    var isSelected = settings.colorSelected == item.color;

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
