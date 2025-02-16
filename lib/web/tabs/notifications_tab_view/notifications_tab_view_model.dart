import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/admin_button/admin_button_widget.dart';
import 'notifications_tab_view_widget.dart' show NotificationsTabViewWidget;
import 'package:flutter/material.dart';

class NotificationsTabViewModel
    extends FlutterFlowModel<NotificationsTabViewWidget> {
  ///  Local state fields for this component.

  NotificationStatus? status = NotificationStatus.inQueue;

  String edited = 'seffsef';

  RubricsRecord? currentRubricDoc;

  ///  State fields for stateful widgets in this component.

  // Model for AdminButton component.
  late AdminButtonModel adminButtonModel1;
  // Model for AdminButton component.
  late AdminButtonModel adminButtonModel2;

  @override
  void initState(BuildContext context) {
    adminButtonModel1 = createModel(context, () => AdminButtonModel());
    adminButtonModel2 = createModel(context, () => AdminButtonModel());
  }

  @override
  void dispose() {
    adminButtonModel1.dispose();
    adminButtonModel2.dispose();
  }
}
