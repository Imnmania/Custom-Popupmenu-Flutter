import 'package:custom_popup_menu_btn_example/custom_pop_up_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popupMenuProvider = StateProvider<BoardType>(
  (ref) => BoardType.list,
);
