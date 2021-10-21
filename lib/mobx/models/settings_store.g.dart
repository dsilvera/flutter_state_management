// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on SettingsStoreBase, Store {
  final _$colorSelectedAtom = Atom(name: 'SettingsStoreBase.colorSelected');

  @override
  Item get colorSelected {
    _$colorSelectedAtom.reportRead();
    return super.colorSelected;
  }

  @override
  set colorSelected(Item value) {
    _$colorSelectedAtom.reportWrite(value, super.colorSelected, () {
      super.colorSelected = value;
    });
  }

  final _$SettingsStoreBaseActionController =
      ActionController(name: 'SettingsStoreBase');

  @override
  void updateColorSelected(Item color) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction(
        name: 'SettingsStoreBase.updateColorSelected');
    try {
      return super.updateColorSelected(color);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
colorSelected: ${colorSelected}
    ''';
  }
}
