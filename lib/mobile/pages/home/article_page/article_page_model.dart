import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/article/article_block_viewer/article_block_viewer_widget.dart';
import '/mobile/pages/home/articles/horoscope/horoscope_view/horoscope_view_widget.dart';
import '/mobile/pages/home/ui/feed_bottom_bar/feed_bottom_bar_widget.dart';
import 'article_page_widget.dart' show ArticlePageWidget;
import 'package:flutter/material.dart';

class ArticlePageModel extends FlutterFlowModel<ArticlePageWidget> {
  ///  Local state fields for this page.

  ArticlesRecord? doc;

  ///  State fields for stateful widgets in this page.

  // Model for ArticleBlockViewer component.
  late ArticleBlockViewerModel articleBlockViewerModel;
  // Model for HoroscopeView component.
  late HoroscopeViewModel horoscopeViewModel;
  // Model for FeedBottomBar component.
  late FeedBottomBarModel feedBottomBarModel1;
  // Model for FeedBottomBar component.
  late FeedBottomBarModel feedBottomBarModel2;

  @override
  void initState(BuildContext context) {
    articleBlockViewerModel =
        createModel(context, () => ArticleBlockViewerModel());
    horoscopeViewModel = createModel(context, () => HoroscopeViewModel());
    feedBottomBarModel1 = createModel(context, () => FeedBottomBarModel());
    feedBottomBarModel2 = createModel(context, () => FeedBottomBarModel());
  }

  @override
  void dispose() {
    articleBlockViewerModel.dispose();
    horoscopeViewModel.dispose();
    feedBottomBarModel1.dispose();
    feedBottomBarModel2.dispose();
  }
}
