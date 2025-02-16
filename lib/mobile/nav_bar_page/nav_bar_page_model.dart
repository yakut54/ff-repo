import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_page_widget.dart' show NavBarPageWidget;
import 'package:flutter/material.dart';

class NavBarPageModel extends FlutterFlowModel<NavBarPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in NavBarPage widget.
  FfPushNotificationsQueueRecord? notificationDoc;
  // Stores action output result for [Backend Call - Read Document] action in NavBarPage widget.
  ArticlesRecord? aDoc;
  // Stores action output result for [Backend Call - Read Document] action in NavBarPage widget.
  RubricsRecord? rDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in NavBarPage widget.
  List<SuggestionsRecord>? suggestionList;
  // Stores action output result for [Firestore Query - Query a collection] action in NavBarPage widget.
  List<ArticlesRecord>? articleList;
  // Stores action output result for [Firestore Query - Query a collection] action in NavBarPage widget.
  List<RubricsRecord>? rubricsList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
