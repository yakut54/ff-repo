import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/cards/suggestion_card/suggestion_card_widget.dart';
import 'suggestion_card_preview_widget.dart' show SuggestionCardPreviewWidget;
import 'package:flutter/material.dart';

class SuggestionCardPreviewModel
    extends FlutterFlowModel<SuggestionCardPreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SuggestionCard component.
  late SuggestionCardModel suggestionCardModel;

  @override
  void initState(BuildContext context) {
    suggestionCardModel = createModel(context, () => SuggestionCardModel());
  }

  @override
  void dispose() {
    suggestionCardModel.dispose();
  }
}
