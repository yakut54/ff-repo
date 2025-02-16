import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/cards/story_card/story_card_widget.dart';
import 'story_card_preview_widget.dart' show StoryCardPreviewWidget;
import 'package:flutter/material.dart';

class StoryCardPreviewModel extends FlutterFlowModel<StoryCardPreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for StoryCard component.
  late StoryCardModel storyCardModel;

  @override
  void initState(BuildContext context) {
    storyCardModel = createModel(context, () => StoryCardModel());
  }

  @override
  void dispose() {
    storyCardModel.dispose();
  }
}
