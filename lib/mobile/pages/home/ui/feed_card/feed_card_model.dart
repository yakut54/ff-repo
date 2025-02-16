import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/ui/feed_bottom_bar/feed_bottom_bar_widget.dart';
import 'feed_card_widget.dart' show FeedCardWidget;
import 'package:flutter/material.dart';

class FeedCardModel extends FlutterFlowModel<FeedCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in FeedCard widget.
  RubricsRecord? rubricsDoc;
  // Model for FeedBottomBar component.
  late FeedBottomBarModel feedBottomBarModel1;
  // Model for FeedBottomBar component.
  late FeedBottomBarModel feedBottomBarModel2;

  @override
  void initState(BuildContext context) {
    feedBottomBarModel1 = createModel(context, () => FeedBottomBarModel());
    feedBottomBarModel2 = createModel(context, () => FeedBottomBarModel());
  }

  @override
  void dispose() {
    feedBottomBarModel1.dispose();
    feedBottomBarModel2.dispose();
  }
}
