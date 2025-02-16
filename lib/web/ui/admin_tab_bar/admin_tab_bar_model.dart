import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_tab_bar_widget.dart' show AdminTabBarWidget;
import 'package:flutter/material.dart';

class AdminTabBarModel extends FlutterFlowModel<AdminTabBarWidget> {
  ///  Local state fields for this component.

  List<AdminMenuStruct> menuItems = [];
  void addToMenuItems(AdminMenuStruct item) => menuItems.add(item);
  void removeFromMenuItems(AdminMenuStruct item) => menuItems.remove(item);
  void removeAtIndexFromMenuItems(int index) => menuItems.removeAt(index);
  void insertAtIndexInMenuItems(int index, AdminMenuStruct item) =>
      menuItems.insert(index, item);
  void updateMenuItemsAtIndex(int index, Function(AdminMenuStruct) updateFn) =>
      menuItems[index] = updateFn(menuItems[index]);

  AdminMenuStruct? currentItem;
  void updateCurrentItemStruct(Function(AdminMenuStruct) updateFn) {
    updateFn(currentItem ??= AdminMenuStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
