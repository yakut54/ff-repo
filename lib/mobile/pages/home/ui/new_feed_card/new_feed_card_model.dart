import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/ui/bottom_test_component/bottom_test_component_widget.dart';
import 'new_feed_card_widget.dart' show NewFeedCardWidget;
import 'package:flutter/material.dart';

class NewFeedCardModel extends FlutterFlowModel<NewFeedCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BottomTestComponent component.
  late BottomTestComponentModel bottomTestComponentModel;

  @override
  void initState(BuildContext context) {
    bottomTestComponentModel =
        createModel(context, () => BottomTestComponentModel());
  }

  @override
  void dispose() {
    bottomTestComponentModel.dispose();
  }
}
