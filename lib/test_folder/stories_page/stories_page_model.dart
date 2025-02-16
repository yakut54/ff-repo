import '/flutter_flow/flutter_flow_util.dart';
import '/test_folder/stories_viewer/stories_viewer_widget.dart';
import 'stories_page_widget.dart' show StoriesPageWidget;
import 'package:flutter/material.dart';

class StoriesPageModel extends FlutterFlowModel<StoriesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StoriesViewer component.
  late StoriesViewerModel storiesViewerModel;

  @override
  void initState(BuildContext context) {
    storiesViewerModel = createModel(context, () => StoriesViewerModel());
  }

  @override
  void dispose() {
    storiesViewerModel.dispose();
  }
}
