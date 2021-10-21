import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_manager/models/color_list_model.dart';
import 'models/riverpod_settings_model.dart';

final colorListProvider = Provider((ref) => ColorListModel());
final settingsProvider = ChangeNotifierProvider((ref) => RiverpodSettingsModel());
