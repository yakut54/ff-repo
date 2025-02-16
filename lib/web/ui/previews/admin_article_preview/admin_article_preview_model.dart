import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/article/article_block_viewer/article_block_viewer_widget.dart';
import 'admin_article_preview_widget.dart' show AdminArticlePreviewWidget;
import 'package:flutter/material.dart';

class AdminArticlePreviewModel
    extends FlutterFlowModel<AdminArticlePreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ArticleBlockViewer component.
  late ArticleBlockViewerModel articleBlockViewerModel;

  @override
  void initState(BuildContext context) {
    articleBlockViewerModel =
        createModel(context, () => ArticleBlockViewerModel());
  }

  @override
  void dispose() {
    articleBlockViewerModel.dispose();
  }
}
