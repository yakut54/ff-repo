import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/content_tab_view/content_tab_view_widget.dart';
import '/web/tabs/notifications_tab_view/notifications_tab_view_widget.dart';
import '/web/tabs/stats_tab_view/stats_tab_view_widget.dart';
import '/web/tabs/subscriptions_tab_view/subscriptions_tab_view_widget.dart';
import '/web/ui/admin_tab_bar/admin_tab_bar_widget.dart';
import 'admin_home_page_widget.dart' show AdminHomePageWidget;
import 'package:flutter/material.dart';

class AdminHomePageModel extends FlutterFlowModel<AdminHomePageWidget> {
  ///  Local state fields for this page.

  AdminMenuStruct? currentTab;
  void updateCurrentTabStruct(Function(AdminMenuStruct) updateFn) {
    updateFn(currentTab ??= AdminMenuStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for AdminTabBar component.
  late AdminTabBarModel adminTabBarModel;
  // Model for ContentTabView component.
  late ContentTabViewModel contentTabViewModel;
  // Model for NotificationsTabView component.
  late NotificationsTabViewModel notificationsTabViewModel;
  // Model for StatsTabView component.
  late StatsTabViewModel statsTabViewModel;
  // Model for SubscriptionsTabView component.
  late SubscriptionsTabViewModel subscriptionsTabViewModel;

  @override
  void initState(BuildContext context) {
    adminTabBarModel = createModel(context, () => AdminTabBarModel());
    contentTabViewModel = createModel(context, () => ContentTabViewModel());
    notificationsTabViewModel =
        createModel(context, () => NotificationsTabViewModel());
    statsTabViewModel = createModel(context, () => StatsTabViewModel());
    subscriptionsTabViewModel =
        createModel(context, () => SubscriptionsTabViewModel());
  }

  @override
  void dispose() {
    adminTabBarModel.dispose();
    contentTabViewModel.dispose();
    notificationsTabViewModel.dispose();
    statsTabViewModel.dispose();
    subscriptionsTabViewModel.dispose();
  }
}
